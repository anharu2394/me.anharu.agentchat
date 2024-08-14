import 'package:flutter/material.dart';
import 'package:flutter_chat_demo/constants/color_constants.dart';
import 'package:flutter_chat_demo/constants/router.dart';
import 'package:flutter_chat_demo/pages/pages.dart';
import 'package:flutter_chat_demo/providers/auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class SplashPage extends ConsumerStatefulWidget {
  SplashPage({super.key});

  @override
  ConsumerState createState() => SplashPageState();
}

class SplashPageState extends ConsumerState<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), () {
      // just delay for showing this slash page clearer because it's too fast
      _checkSignedIn();
    });
  }

  void _checkSignedIn() async {
    bool isLoggedIn = await ref.read(authProvider.notifier).isLoggedIn();
    if (isLoggedIn) {
      context.pushReplacement(Routes.home);
    } else {
      context.pushReplacement(Routes.home);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              "images/app_icon.png",
              width: 100,
              height: 100,
            ),
            SizedBox(height: 20),
            Container(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(color: ColorConstants.themeColor),
            ),
          ],
        ),
      ),
    );
  }
}
