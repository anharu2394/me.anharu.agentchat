import 'package:flutter_chat_demo/di/firebase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/project.dart';

part 'project.g.dart';

@riverpod
class ProjectDetail extends _$ProjectDetail {
  @override
  FutureOr<Project?> build(String projectId) async {
    return _fetchProject(projectId);
  }

  Future<Project?> _fetchProject(String projectId) async {
    final firestore = ref.read(firebaseFirestoreProvider);
    final docSnapshot = await firestore
        .collection('projects')
        .doc(projectId)
        .get();

    if (!docSnapshot.exists) {
      return null;
    }

    return Project.fromJson(docSnapshot.data() as Map<String, dynamic>);
  }
}
