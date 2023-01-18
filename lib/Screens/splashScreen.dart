import 'dart:async';
import 'package:firebase_project/Screens/onbording.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // super.dispose();
    Timer(
      Duration(seconds: 3),
      () => Get.to(OnBording()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        height: double.infinity,
        color: Colors.white,
        child: Lottie.asset("asset/lottie.json"),
      ),
    ));
  }
}
