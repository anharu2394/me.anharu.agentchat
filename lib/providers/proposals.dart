import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/proposal.dart';
import '../di/firebase.dart';
import '../providers/auth.dart';

part 'proposals.g.dart';

@riverpod
class Proposals extends _$Proposals {
  FirebaseFirestore get firebaseFirestore =>
      ref.read(firebaseFirestoreProvider);

  @override
  Future<List<Proposal>> build() async {
    final authState = ref.watch(authProvider);
    return authState.when(
      data: (user) {
        if (user == null) {
          return Future.value([]);
        }
        return _fetchProposals(user.id);
      },
      loading: () => Future.value([]),
      error: (_, __) => Future.value([]),
    );
  }

  Future<List<Proposal>> _fetchProposals(String userId) async {
    final querySnapshot = await firebaseFirestore
        .collection('projects')
        .where('createdBy', isEqualTo: userId)
        .get();

    final proposals = await Future.wait(querySnapshot.docs.map((projectDoc) async {
      final proposalsSnapshot = await firebaseFirestore
          .collection('proposals')
          .doc(projectDoc.id)
          .collection('proposals')
          .get();

      return proposalsSnapshot.docs.map((proposalDoc) => 
        Proposal.fromFirestore(proposalDoc)
      ).toList();
    }));

    return proposals.expand((element) => element).toList();
  }

  Future<void> addProposal(Proposal proposal, String projectId) async {
    final user = ref.read(authProvider).value;
    if (user == null) {
      throw Exception('ユーザーがログインしていません');
    }

    final newProposal = proposal.copyWith(userId: user.id);
    final proposalRef = firebaseFirestore.collection('proposals').doc(projectId).collection('proposals').doc();
    await proposalRef.set(newProposal.toJson());
    ref.invalidateSelf();
  }
}
