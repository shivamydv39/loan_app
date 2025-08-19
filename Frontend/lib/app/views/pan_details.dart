import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../widgets/stepper.dart';
import 'loan_calculator_view.dart';

class PanDetails extends StatefulWidget {
  @override
  State<PanDetails> createState() => _PanDetailsState();
}

class _PanDetailsState extends State<PanDetails> {
  final TextEditingController panController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // 🔹 Stepper on top
          Padding(
            padding: const EdgeInsets.only(top: 53),
            child: StepperHeader(currentStep: 1),
          ),

          // 🔹 Bottom sheet style
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6,
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Scrollable content
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Back + Title
                          Row(
                            children: [
                              IconButton(
                                icon: Icon(Icons.arrow_back),
                                onPressed: () => Navigator.pop(context),
                              ),
                              Text(
                                "Verify PAN Number",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),

                          // Vector/Image Placeholder
                          Center(
                            child: Container(
                              height: 150,
                              width: 200,
                              child: Image.asset(
                                "assets/images/card.png", // 👈 apna asset lagao
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          const SizedBox(height: 24),

                          // PAN Input
                          Text(
                            "Enter Your PAN Number*",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(height: 8),
                          TextField(
                            controller: panController,
                            decoration: InputDecoration(
                              hintText: "e.g., ABCDE1234F",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Verify button
                  SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            backgroundColor: Colors.blue,
                          ),
                          onPressed: () {
                            String pan = panController.text.trim();
                            if (pan.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Please enter PAN number")),
                              );
                            } else {
                              // Next step action
                              Get.to(() => LoanCalculatorView());

                            }
                          },
                          child: Text("Verify", style: TextStyle(fontSize: 16)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
