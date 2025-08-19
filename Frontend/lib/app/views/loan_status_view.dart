import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/loan_controller.dart';
import '../widgets/stepper.dart';

class LoanStatusView extends StatelessWidget {
  final LoanController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    controller.fetchLoanStatus();

    return Scaffold(
      body: Column(
        children: [
          /// 🔹 Top Stepper Header
          Padding(
            padding: const EdgeInsets.only(top: 53),
            child: StepperHeader(currentStep: 3), // ✅ Approval step active
          ),

          /// 🔹 BottomSheet style container
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
                  /// Title
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      "Application Status",
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),

                  /// Loan ID (mock for now)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      "Loan application no. #CS12323",
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                  ),

                  SizedBox(height: 12),

                  /// 🔹 Status Steps
                  Expanded(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        children: [
                          _statusStep("Application Submitted", true, Colors.green),
                          _statusStep("Application under Review", true, Colors.blue),
                          _statusStep("E-KYC", false, Colors.grey),
                          _statusStep("E-Nach", false, Colors.grey),
                          _statusStep("E-Sign", false, Colors.grey),
                          _statusStep("Disbursement", false, Colors.grey),

                          SizedBox(height: 20),

                          /// Info text
                          Column(
                            children: [
                              Icon(Icons.account_balance_wallet_outlined,
                                  size: 48, color: Colors.blue),
                              SizedBox(height: 12),
                              Text(
                                "Application Under Review",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87),
                              ),
                              SizedBox(height: 8),
                              Text(
                                "We’re carefully reviewing your application to ensure everything is in order. Thank you for your patience.",
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.black54),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  /// 🔹 Continue button
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
                            // Yaha aap next screen define kar sakte ho
                            Get.snackbar("Next", "Continue pressed");
                          },
                          child: Text("Continue",
                              style: TextStyle(fontSize: 16)),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 🔹 Helper Widget for Status Step
  Widget _statusStep(String title, bool active, Color color) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: active ? color : Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
        color: active ? color.withOpacity(0.1) : Colors.white,
      ),
      child: Row(
        children: [
          Icon(Icons.event_note,
              color: active ? color : Colors.grey, size: 22),
          SizedBox(width: 12),
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: active ? FontWeight.w600 : FontWeight.normal,
              color: active ? color : Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}
