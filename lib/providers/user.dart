import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_chat_demo/di/firebase.dart';
import 'package:flutter_chat_demo/models/user_chat.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user.g.dart';

@riverpod
class User extends _$User {
  FirebaseFirestore get firebaseFirestore =>
      ref.read(firebaseFirestoreProvider);

  @override
  Future<UserChat?> build(String userId) async {
    try {
      final doc = await firebaseFirestore.collection('users').doc(userId).get();
      if (doc.exists) {
        return UserChat.fromDocument(doc);
      } else {
        return null;
      }
    } catch (e) {
      print('ユーザー取得エラー: $e');
      return null;
    }
  }
}

