import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_chat_demo/models/project.dart';
import 'package:flutter_chat_demo/models/room.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/proposal.dart';
import '../di/firebase.dart';
import '../providers/auth.dart';

part 'proposal.g.dart';

class ProposalState {
  final Proposal? proposal;
  final String? roomId;

  ProposalState({required this.proposal, this.roomId});

  ProposalState copyWith({Proposal? proposal, String? roomId}) {
    return ProposalState(
      proposal: proposal ?? this.proposal,
      roomId: roomId ?? this.roomId,
    );
  }
}

@riverpod
class ProposalDetail extends _$ProposalDetail {
  FirebaseFirestore get firebaseFirestore =>
      ref.read(firebaseFirestoreProvider);

  @override
  Future<ProposalState> build(String proposalId) async {
    final authState = ref.watch(authProvider);
    return authState.when(
      data: (user) {
        if (user == null) {
          return Future.value(ProposalState(proposal: null, roomId: null));
        }
        return _fetchProposalState(user.id, proposalId);
      },
      loading: () => Future.value(ProposalState(proposal: null, roomId: null)),
      error: (_, __) => Future.value(ProposalState(proposal: null, roomId: null)),
    );
  }

  Future<ProposalState> _fetchProposalState(String userId, String proposalId) async {
    final projectsSnapshot = await firebaseFirestore
        .collection('projects')
        .where('createdBy', isEqualTo: userId)
        .get();

    for (var projectDoc in projectsSnapshot.docs) {
      final proposalSnapshot = await firebaseFirestore
          .collection('proposals')
          .doc(projectDoc.id)
          .collection('proposals')
          .doc(proposalId)
          .get();

      if (proposalSnapshot.exists) {
        final proposal = Proposal.fromFirestore(proposalSnapshot);
        final roomSnapshot = await firebaseFirestore
            .collection('rooms')
            .where('linkedProjectId', isEqualTo: projectDoc.id)
            .where('participants.$userId')
            .where('participants.${proposal.userId}')
            .get();

        String? roomId = roomSnapshot.docs.isNotEmpty ? roomSnapshot.docs.first.id : null;
        return ProposalState(proposal: proposal, roomId: roomId);
      }
    }

    return ProposalState(proposal: null, roomId: null);
  }

  Future<void> approveProposal(String proposalId) async {
    final authState = await ref.read(authProvider.future);
    if (authState == null) {
      throw Exception('ユーザーが認証されていません');
    }
    String? roomId = null;
    await firebaseFirestore.runTransaction((transaction) async {
      // ユーザーの作成したプロジェクトを検索
      final projectsSnapshot = await firebaseFirestore
          .collection('projects')
          .where('createdBy', isEqualTo: authState.id)
          .get();

      String? projectId;
      DocumentSnapshot? proposalSnapshot;

      // プロポーザルを含むプロジェクトを探す
      for (var projectDoc in projectsSnapshot.docs) {
        final proposalRef = firebaseFirestore
            .collection('proposals')
            .doc(projectDoc.id)
            .collection('proposals')
            .doc(proposalId);
        
        proposalSnapshot = await transaction.get(proposalRef);
        if (proposalSnapshot.exists) {
          projectId = projectDoc.id;
          break;
        }
      }

      if (projectId == null || proposalSnapshot == null) {
        throw Exception('プロポーザルが見つかりません');
      }

      // プロジェクトのデータを取得
      final projectSnapshot = await transaction.get(firebaseFirestore.collection('projects').doc(projectId));
      final projectData = projectSnapshot.data() as Map<String, dynamic>;
      final proposalData = proposalSnapshot.data() as Map<String, dynamic>;

      if (projectData.isEmpty || proposalData.isEmpty) {
        throw Exception('プロジェクトまたはプロポーザルのデータが不足しています');
      }

      print(proposalData);
      final project = Project.fromFirestore(projectSnapshot);
      final proposal = Proposal.fromFirestore(proposalSnapshot);
      final projectCreatorId = project.createdBy;
      final proposalCreatorId = proposal.userId;

      // プロポーザルのステータスを更新
      final proposalRef = firebaseFirestore
          .collection('proposals')
          .doc(projectId)
          .collection('proposals')
          .doc(proposalId);
      transaction.update(proposalRef, {'status': 'approved'});

      // 新しいルームを作成
      final roomRef = firebaseFirestore.collection('rooms').doc();
      final now = DateTime.now();
      final room = Room(
        id: roomRef.id,
        type: 'private',
        createdAt: now,
        updatedAt: now,
        participants: {
          projectCreatorId: Participant(
            joinedAt: now,
            role: 'admin'
          ),
          proposalCreatorId: Participant(
            joinedAt: now,
            role: 'member'
          )
        },
        lastMessage: LastMessage(
          messageId: '',
          text: 'ルームが作成されました',
          senderId: 'system',
          timestamp: now,
          isDeleted: false
        ),
        allowedRoles: ['admin', 'worker'],
        linkedProjectId: projectId
      );
      transaction.set(roomRef, room.toJson());
      roomId = roomRef.id;
    });
    state = AsyncValue.data(state.value?.copyWith(roomId: roomId) ??
        ProposalState(roomId: roomId, proposal: null));
    ref.invalidateSelf();
  }

  Future<void> withdrawProposal(String proposalId) async {
    final authState = await ref.read(authProvider.future);
    if (authState == null) {
      throw Exception('ユーザーが認証されていません');
    }

    // ユーザーの作成したプロジェクトを検索
    final projectsSnapshot = await firebaseFirestore
        .collection('projects')
        .where('createdBy', isEqualTo: authState.id)
        .get();

    for (var projectDoc in projectsSnapshot.docs) {
      final proposalRef = firebaseFirestore
          .collection('proposals')
          .doc(projectDoc.id)
          .collection('proposals')
          .doc(proposalId);
      
      final proposalSnapshot = await proposalRef.get();
      if (proposalSnapshot.exists) {
        await proposalRef.update({'status': 'rejected'});
        ref.invalidateSelf();
        return;
      }
    }

    throw Exception('プロポーザルが見つかりません');
  }
}
