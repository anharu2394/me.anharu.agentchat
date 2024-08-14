import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_chat_demo/constants/firestore_constants.dart';
import 'package:flutter_chat_demo/di/firebase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home.g.dart';

@riverpod
class Home extends _$Home {
  FirebaseFirestore get _firebaseFirestore => ref.read(firebaseFirestoreProvider);

  @override
  FutureOr<void> build() {
  }

  Future<void> updateDataFirestore(
      String collectionPath, String path, Map<String, String> dataNeedUpdate) {
    return _firebaseFirestore
        .collection(collectionPath)
        .doc(path)
        .update(dataNeedUpdate);
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getStreamFireStore(
      String pathCollection, int limit, String? textSearch) {
    if (textSearch?.isNotEmpty == true) {
      return _firebaseFirestore
          .collection(pathCollection)
          .limit(limit)
          .where(FirestoreConstants.nickname, isEqualTo: textSearch)
          .snapshots();
    } else {
      return _firebaseFirestore
          .collection(pathCollection)
          .limit(limit)
          .snapshots();
    }
  }
}

@riverpod
Stream<QuerySnapshot<Map<String, dynamic>>> fireStoreStream(
  FireStoreStreamRef ref,
  String pathCollection,
  int limit,
  String? textSearch,
) {
  return ref
      .watch(homeProvider.notifier)
      .getStreamFireStore(pathCollection, limit, textSearch);
}
