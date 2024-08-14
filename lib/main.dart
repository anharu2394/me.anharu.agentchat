import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' hide AuthProvider;
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_demo/constants/app_constants.dart';
import 'package:flutter_chat_demo/constants/router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constants/color_constants.dart';
import 'pages/pages.dart';
import 'providers/providers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  runApp(ProviderScope(child: MyApp(prefs: prefs)));
}

class MyApp extends StatelessWidget {
  final SharedPreferences prefs;

  MyApp({required this.prefs});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
    );
  }
}
