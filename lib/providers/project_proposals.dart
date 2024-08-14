import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/proposal.dart';
import '../di/firebase.dart';

part 'project_proposals.g.dart';

@riverpod
class ProjectProposals extends _$ProjectProposals {
  FirebaseFirestore get firebaseFirestore =>
      ref.read(firebaseFirestoreProvider);

  @override
  Future<List<Proposal>> build(String projectId) async {
    return _fetchProposals(projectId);
  }

  Future<List<Proposal>> _fetchProposals(String projectId) async {
    final querySnapshot = await firebaseFirestore
        .collection('proposals')
        .doc(projectId)
        .collection('proposals')
        .get();

    return querySnapshot.docs
        .map((doc) => Proposal.fromJson(doc.data() as Map<String, dynamic>))
        .toList();
  }
}
