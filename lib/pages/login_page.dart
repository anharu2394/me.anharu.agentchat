import 'package:flutter/material.dart';
import 'package:flutter_chat_demo/constants/app_constants.dart';
import 'package:flutter_chat_demo/constants/color_constants.dart';
import 'package:flutter_chat_demo/constants/router.dart';
import 'package:flutter_chat_demo/pages/pages.dart';
import 'package:flutter_chat_demo/providers/auth.dart';
import 'package:flutter_chat_demo/widgets/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class LoginPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);
    final authNotifier = ref.watch(authProvider.notifier);

    authState.when(
      data: (auth) {
        if (auth != null) {
          Fluttertoast.showToast(msg: "Sign in success");
        } else {
          Fluttertoast.showToast(msg: "Sign in failed");
        }
      },
      loading: () {
        Fluttertoast.showToast(msg: "Loading...");
      },
      error: (error, stackTrace) {
        Fluttertoast.showToast(msg: "Sign in fail $error");
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppConstants.loginTitle,
          style: TextStyle(color: ColorConstants.primaryColor),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Center(
            child: TextButton(
              onPressed: () async {
                authNotifier.handleSignIn().then((isSuccess) {
                  if (isSuccess) {
                    context.pushReplacement(Routes.home);
                  }
                }).catchError((error, stackTrace) {
                  print(error);
                  print(stackTrace);
                  Fluttertoast.showToast(msg: error.toString());
                  authNotifier.handleException(error, stackTrace);
                });
              },
              child: Text(
                'Sign in with Google',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed))
                      return Color(0xffdd4b39).withOpacity(0.8);
                    return Color(0xffdd4b39);
                  },
                ),
                splashFactory: NoSplash.splashFactory,
                padding: MaterialStateProperty.all<EdgeInsets>(
                  EdgeInsets.fromLTRB(30, 15, 30, 15),
                ),
              ),
            ),
          ),
          // Loading
          Positioned(
            child: authState is AsyncLoading
                ? LoadingView()
                : SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
