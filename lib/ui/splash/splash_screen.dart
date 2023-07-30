import 'package:flutter/material.dart';
import 'package:flutter_musobaqa/utils/images/app_images.dart';

import 'package:flutter_musobaqa/app/app.dart';
import 'package:flutter_musobaqa/utils/colors/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _init() async {
    await Future.delayed(const Duration(seconds: 3));

    if (context.mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return RouterApp();
          },
        ),
      );
    }
  }

  @override
  void initState() {
    _init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.45,
          width: MediaQuery.of(context).size.width * 0.8,
          child: Image.asset(
            AppImages.pomidor,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
