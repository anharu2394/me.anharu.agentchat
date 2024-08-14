import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_chat_demo/di/firebase.dart';
import 'package:flutter_chat_demo/models/project.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'auth.dart';

part 'projects.g.dart';

@riverpod
class Projects extends _$Projects {
  FirebaseFirestore get firebaseFirestore =>
      ref.read(firebaseFirestoreProvider);

  @override
  Future<List<Project>> build() async {
    final authState = ref.watch(authProvider);
    return authState.when(
      data: (user) {
        if (user == null) {
          return Future.value([]);
        }
        return _fetchOtherProjects(user.id);
      },
      loading: () => Future.value([]),
      error: (_, __) => Future.value([]),
    );
  }

  Future<List<Project>> _fetchOtherProjects(String userId) async {
    final querySnapshot = await firebaseFirestore
        .collection('projects')
        .where('createdBy', isNotEqualTo: userId)
        .get();

    return querySnapshot.docs
        .map((doc) => Project.fromJson({...doc.data(), 'id': doc.id}))
        .toList();
  }
}
