import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_demo/di/firebase.dart';
import 'package:flutter_chat_demo/models/models.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/project.dart';
import '../providers/auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

part 'my_projects.g.dart';

@riverpod
class MyProjects extends _$MyProjects {
  FirebaseFirestore get firebaseFirestore =>
      ref.read(firebaseFirestoreProvider);
  @override
  Future<UserProjects> build() async {
    final authState = ref.watch(authProvider);
    return authState.when(
      data: (user) {
        if (user == null) {
          return Future.value(
              UserProjects(created: [], proposed: [], accepted: []));
        }
        return _fetchProjects(user.id);
      },
      loading: () =>
          Future.value(UserProjects(created: [], proposed: [], accepted: [])),
      error: (_, __) =>
          Future.value(UserProjects(created: [], proposed: [], accepted: [])),
    );
  }

  Future<UserProjects> _fetchProjects(String userId) async {
    final userProjectsDoc =
        await firebaseFirestore.collection('userProjects').doc(userId).get();

    if (!userProjectsDoc.exists) {
      return UserProjects(created: [], proposed: [], accepted: []);
    }

    final userProjectIds = UserProjectIds.fromJson(userProjectsDoc.data()!);
    final result = UserProjects(
      created: await _getProjects(userProjectIds.created),
      proposed: await _getProjects(userProjectIds.proposed),
      accepted: await _getProjects(userProjectIds.accepted),
    );

    return result;
  }

  Future<List<Project>> _getProjects(List<String> projectIds) async {
    final projects = await Future.wait(
      projectIds.map((id) => _getProject(id)),
    );
    return projects.whereType<Project>().toList();
  }

  Future<Project?> _getProject(String projectId) async {
    final doc =
        await firebaseFirestore.collection('projects').doc(projectId).get();
    return doc.exists ? Project.fromJson({...doc.data()!, 'id': doc.id}) : null;
  }

  Future<void> addProject(Project project) async {
    print("プロジェクトを追加");
    final authState = ref.read(authProvider);
    print("認証状態: $authState");

    return authState.when(
      data: (user) async {
        if (user == null) {
          print("ユーザーがログインしていません");
          return;
        }
        print("ユーザー情報: ${user.id}");
        try {
          print("プロジェクトを追加中...");
          var projectJson = project.toJson();
          projectJson.remove("id");
          print("プロジェクト: $projectJson");

          // トランザクションを使用してプロジェクトの追加とユーザープロジェクトの更新を一括で行う
          await firebaseFirestore.runTransaction((transaction) async {
            // ユーザープロジェクトを読み取り
            final userProjectRef =
                firebaseFirestore.collection('userProjects').doc(user.id);
            final userProjectSnapshot = await transaction.get(userProjectRef);
            
            // プロジェクトを追加
            final projectRef = firebaseFirestore.collection('projects').doc();
            transaction.set(projectRef, projectJson);
            print("プロジェクトが追加されました。ID: ${projectRef.id}");

            // ユーザープロジェクトを更新
            UserProjectIds userProjectIds;
            if (userProjectSnapshot.exists) {
              final data = userProjectSnapshot.data();
              if (data != null) {
                print("ユーザープロジェクトのデータ: $data");
                userProjectIds = UserProjectIds.fromJson(data);
              } else {
                userProjectIds = UserProjectIds(created: [], proposed: [], accepted: []);
              }
            } else {
              userProjectIds = UserProjectIds(created: [], proposed: [], accepted: []);
            }
            userProjectIds = userProjectIds.copyWith(
              created: [...userProjectIds.created, projectRef.id]
            );
            transaction.set(userProjectRef, userProjectIds.toJson(),
                SetOptions(merge: true));
            print("ユーザープロジェクトを更新しました");
          });

          ref.invalidateSelf();
          print("プロジェクトが正常に追加されました");

          // デバッグ用：プロジェクトコレクションを取得して表示
          final projectsSnapshot =
              await firebaseFirestore.collection('projects').get();
          print('プロジェクト一覧:');
          for (var doc in projectsSnapshot.docs) {
            print('ID: ${doc.id}, データ: ${doc.data()}');
          }
        } catch (e, stackTrace) {
          print("エラー発生: $e");
          print("スタックトレース: $stackTrace");

          Fluttertoast.showToast(
              msg: "プロジェクトの追加中にエラーが発生しました: $e",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        }
      },
      loading: () {
        print("認証状態を読み込み中");
      },
      error: (error, stackTrace) {
        print("認証エラー: $error");
        print("スタックトレース: $stackTrace");
      },
    );
  }

  Future<void> updateProject(String projectId, Project project) async {
    await firebaseFirestore
        .collection('projects')
        .doc(projectId)
        .update(project.toJson());
    ref.invalidateSelf();
  }

  Future<void> deleteProject(String projectId) async {
    final authState = ref.read(authProvider);
    return authState.when(
      data: (user) async {
        if (user == null) return;
        await firebaseFirestore.collection('projects').doc(projectId).delete();
        await firebaseFirestore.collection('userProjects').doc(user.id).update({
          'created': FieldValue.arrayRemove([projectId]),
          'proposed': FieldValue.arrayRemove([projectId]),
          'accepted': FieldValue.arrayRemove([projectId]),
        });
        ref.invalidateSelf();
      },
      loading: () => null,
      error: (_, __) => null,
    );
  }
}
