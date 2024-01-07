import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:idoc/utils/shared_pref_instance.dart';
import 'package:idoc/views/auth/login_screen.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future.delayed(const Duration(seconds: 3), () {
      String? token = SharedPreference.instance.getData('token');
      Navigator.pushNamedAndRemoveUntil(context, LoginScreen.routeName,(route)=>false);
    });
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child:Hero(
          tag: "AppIcon",
          child: Lottie.asset(
            'assets/anim/heart_beat.json',
          ),
        ),
      )
    );
  }
}
