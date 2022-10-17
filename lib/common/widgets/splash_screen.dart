import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shop_app/features/auth/screens/signin_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _SplashScreenState() {
    bool _isVisible = false;

    new Timer(const Duration(milliseconds: 2000), () {
      setState(() {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const SignInScreen()),
            (route) => false);
      });
    });

    new Timer(Duration(milliseconds: 10), () {
      setState(() {
        _isVisible = true;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: AnimatedOpacity(
        opacity: 1.0,
        duration: const Duration(
          milliseconds: 1200,
        ),
        child: Center(
          child: SizedBox(
            height: 280,
            width: 280,
            child: Center(
              child: ClipOval(
                child: Image.asset(
                  //هنا تقدر تغير الصورة
                  'assets/images/myShop.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
