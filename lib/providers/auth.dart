import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_demo/constants/constants.dart';
import 'package:flutter_chat_demo/di/firebase.dart';
import 'package:flutter_chat_demo/di/google_sign_in.dart';
import 'package:flutter_chat_demo/di/shared_preferences.dart';
import 'package:flutter_chat_demo/models/models.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth.g.dart';

@riverpod
class Auth extends _$Auth {
  GoogleSignIn get googleSignIn => ref.read(googleSignInProvider);
  FirebaseAuth get firebaseAuth => ref.read(firebaseAuthProvider);
  FirebaseFirestore get firebaseFirestore =>
      ref.read(firebaseFirestoreProvider);
  Future<SharedPreferences> get prefsFuture =>
      ref.read(sharedPreferencesProvider.future);

  Future<String?> get userFirebaseId async =>
      (await prefsFuture).getString(FirestoreConstants.id);

  Future<UserChat?> build() async {
    final result = await firebaseFirestore
        .collection(FirestoreConstants.pathUserCollection)
        .where(FirestoreConstants.id, isEqualTo: await userFirebaseId)
        .get();
    final documents = result.docs;
    if (documents.length == 0) {
      return null;
    } else {
      final documentSnapshot = documents.first;
      return UserChat.fromJson(documentSnapshot.data());
    }
  }

  Future<bool> isLoggedIn() async {
    bool isLoggedIn = await googleSignIn.isSignedIn();
    if (isLoggedIn && (await userFirebaseId)?.isNotEmpty == true) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> handleSignIn() async {
    state = AsyncValue.loading();

    try {
      final googleUser = await googleSignIn.signIn();
      if (googleUser == null) {
        state = AsyncValue.data(null);
        return false;
      }

      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final firebaseUser =
          (await firebaseAuth.signInWithCredential(credential)).user;
      if (firebaseUser == null) {
        state = AsyncValue.data(null);
        return false;
      }

      final result = await firebaseFirestore
          .collection(FirestoreConstants.pathUserCollection)
          .where(FirestoreConstants.id, isEqualTo: firebaseUser.uid)
          .get();
      final documents = result.docs;
      final prefs = await prefsFuture;
      if (documents.length == 0) {
        // Writing data to server because here is a new user
        firebaseFirestore
            .collection(FirestoreConstants.pathUserCollection)
            .doc(firebaseUser.uid)
            .set({
          FirestoreConstants.nickname: firebaseUser.displayName,
          FirestoreConstants.photoUrl: firebaseUser.photoURL,
          FirestoreConstants.id: firebaseUser.uid,
          FirestoreConstants.createdAt:
              DateTime.now().millisecondsSinceEpoch.toString(),
          FirestoreConstants.chattingWith: null,
          "role": "worker",
        });

        // Write data to local storage
        User? currentUser = firebaseUser;
        await prefs.setString(FirestoreConstants.id, currentUser.uid);
        await prefs.setString(
            FirestoreConstants.nickname, currentUser.displayName ?? "");
        await prefs.setString(
            FirestoreConstants.photoUrl, currentUser.photoURL ?? "");
        await prefs.setString("role", "worker");
      } else {
        // Already sign up, just get data from firestore
        final documentSnapshot = documents.first;
        final userChat = UserChat.fromJson(documentSnapshot.data());
        state = AsyncData(userChat);
        // Write data to local

        await prefs.setString(FirestoreConstants.id, userChat.id);
        await prefs.setString(FirestoreConstants.nickname, userChat.nickname);
        await prefs.setString(FirestoreConstants.photoUrl, userChat.photoUrl);
        await prefs.setString(
            FirestoreConstants.aboutMe, userChat.aboutMe ?? "");
        await prefs.setString("role", userChat.role.name);
      }
      return true;
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
      return false;
    }
  }

  void handleException(e, stackTrace) {
    state = AsyncValue.error(e, stackTrace);
  }

  Future<void> handleSignOut() async {
    state = AsyncValue.data(null);
    await firebaseAuth.signOut();
    await googleSignIn.disconnect();
    await googleSignIn.signOut();
  }
}
