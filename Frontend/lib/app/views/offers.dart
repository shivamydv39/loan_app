import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../widgets/stepper.dart';
import 'loan_status_view.dart';

class OfferView extends StatelessWidget {
  const OfferView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 53),
            child: StepperHeader(currentStep: 2),
          ),

          const SizedBox(height: 24),
          Text(
            "Our Offerings",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 16),
          SizedBox(
            height: 160,
            child: Lottie.asset(
              "assets/animation/Increasing Coin Animation.json",
              repeat: true,
              fit: BoxFit.contain,
            ),
          ),

          const SizedBox(height: 16),

          /// 🔹 Offer Text
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "Congratulations! ",
                        style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text:
                        "We can offer you Rs. 10,000 Amount within 30 minutes for 90 days, "
                            "with a payable amount of Rs. 10,600. ",
                        style: TextStyle(color: Colors.black87),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  "Proceed further to",
                  style: TextStyle(color: Colors.black54),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),

          Spacer(),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        // Snackbar using GetX
                        Get.snackbar(
                          "Offer",
                          "Offer Accepted",
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.green.shade100,
                          colorText: Colors.black,
                        );

                        // Navigate using GetX
                        Get.to(() => LoanStatusView());
                      },
                      child: Text(
                        "Accept Offer",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        Get.snackbar("Offer", "Offer Extended");
                      },
                      child: Text("Extend Offer", style: TextStyle(fontSize: 16)),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
