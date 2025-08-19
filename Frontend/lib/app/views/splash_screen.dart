import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Controller for Splash Screen
class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _navigateToNext();
  }

  void _navigateToNext() async {
    await Future.delayed(const Duration(seconds: 2));
    // Yaha login check kar sakte ho (isLoggedIn ? Home : Login)
    Get.offAllNamed('/login'); // replace with your route
  }
}

/// Splash Screen UI
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController()); // init controller

    return Scaffold(
      backgroundColor: const Color(0xFF004C99), // CreditSea blue
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // App Logo
            Image.asset(
              'assets/images/Group.png', // apna logo path
              width: 120,
            ),
            const SizedBox(height: 20),
            // App Name
            RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: "Credit",
                    style: TextStyle(
                      fontSize: 37.9,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  TextSpan(
                    text: "Sea",
                    style: TextStyle(
                      fontSize: 37.9,
                      fontWeight: FontWeight.w200,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
