import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'firebase.g.dart';


@Riverpod(keepAlive: true)
FirebaseFirestore firebaseFirestore(FirebaseFirestoreRef ref) {
  return FirebaseFirestore.instance;
}

@Riverpod(keepAlive: true)
FirebaseStorage firebaseStorage(FirebaseStorageRef ref) {
  return FirebaseStorage.instance;
}

@Riverpod(keepAlive: true)
FirebaseAuth firebaseAuth(FirebaseAuthRef ref) {
  return FirebaseAuth.instance;
}
