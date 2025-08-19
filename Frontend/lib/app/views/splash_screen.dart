import 'package:flutter/material.dart';
import 'package:get/get.dart';
class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _navigateToNext();
  }

  void _navigateToNext() async {
    await Future.delayed(const Duration(seconds: 2));
    Get.offAllNamed('/login');
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());

    return Scaffold(
      backgroundColor: const Color(0xFF004C99),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // App Logo
            Image.asset(
              'assets/images/Group.png',
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
