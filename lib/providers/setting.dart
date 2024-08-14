import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_chat_demo/di/firebase.dart';
import 'package:flutter_chat_demo/di/shared_preferences.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'setting.g.dart';

@Riverpod(keepAlive: true)
class Setting extends _$Setting {
  Future<SharedPreferences> get _prefs => ref.watch(sharedPreferencesProvider.future);
  FirebaseFirestore get _firebaseFirestore =>
      ref.read(firebaseFirestoreProvider);
  FirebaseStorage get _firebaseStorage => ref.read(firebaseStorageProvider);

  @override
  FutureOr<void> build() async {
  }

  Future<String?> getPref(String key) async {
    final prefs = await _prefs;
    return prefs.getString(key);
  }

  Future<bool> setPref(String key, String value) async {
    final prefs = await _prefs;
    return prefs.setString(key, value);
  }

  UploadTask uploadFile(File image, String fileName) {
    final reference = _firebaseStorage.ref().child(fileName);
    return reference.putFile(image);
  }

  Future<void> updateDataFirestore(
      String collectionPath, String path, Map<String, dynamic> dataNeedUpdate) {
    return _firebaseFirestore
        .collection(collectionPath)
        .doc(path)
        .update(dataNeedUpdate);
  }
}


@riverpod
Future<bool> setPrefValue(SetPrefValueRef ref, String key, String value) {
  return ref.watch(settingProvider.notifier).setPref(key, value);
}
