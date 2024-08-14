import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_chat_demo/constants/constants.dart';
import 'package:flutter_chat_demo/di/firebase.dart';
import 'package:flutter_chat_demo/di/shared_preferences.dart';
import 'package:flutter_chat_demo/models/models.dart';
import 'package:provider/provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'chat.g.dart';

@riverpod
class Chat extends _$Chat {
  FirebaseFirestore get _firebaseFirestore => ref.read(firebaseFirestoreProvider);
  FirebaseStorage get _firebaseStorage => ref.read(firebaseStorageProvider);

  @override
  FutureOr<void> build() async {
  }

  UploadTask uploadFile(File image, String fileName) {
    Reference reference = _firebaseStorage.ref().child(fileName);
    return reference.putFile(image);
  }

  Future<void> updateDataFirestore(String collectionPath, String docPath,
      Map<String, dynamic> dataNeedUpdate) {
    return _firebaseFirestore
        .collection(collectionPath)
        .doc(docPath)
        .update(dataNeedUpdate);
  }

  Stream<QuerySnapshot> getChatStream(String groupChatId, int limit) {
    return _firebaseFirestore
        .collection(FirestoreConstants.pathMessageCollection)
        .doc(groupChatId)
        .collection(groupChatId)
        .orderBy(FirestoreConstants.timestamp, descending: true)
        .limit(limit)
        .snapshots();
  }

  void sendMessage(String content, int type, String groupChatId,
      String currentUserId, String peerId) {
    final documentReference = _firebaseFirestore
        .collection(FirestoreConstants.pathMessageCollection)
        .doc(groupChatId)
        .collection(groupChatId)
        .doc(DateTime.now().millisecondsSinceEpoch.toString());

    final messageChat = MessageChat(
      idFrom: currentUserId,
      idTo: peerId,
      timestamp: DateTime.now().millisecondsSinceEpoch.toString(),
      content: content,
      type: type,
    );

    FirebaseFirestore.instance.runTransaction((transaction) async {
      transaction.set(
        documentReference,
        messageChat.toJson(),
      );
    });
  }
}

@riverpod
Stream<QuerySnapshot> chatStream(
    ChatStreamRef ref, String groupChatId, int limit) {
  return ref
      .watch(chatProvider.notifier)
      .getChatStream(groupChatId, limit);
}

@riverpod
class MessageSender extends _$MessageSender {
  @override
  void build() {}

  void sendMessage(String content, int type, String groupChatId,
      String currentUserId, String peerId) {
    ref
        .read(chatProvider.notifier)
        .sendMessage(content, type, groupChatId, currentUserId, peerId);
  }
}
