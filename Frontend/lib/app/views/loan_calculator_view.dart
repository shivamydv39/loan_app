import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/loan_controller.dart';
import 'offers.dart';

class LoanCalculatorView extends StatefulWidget {
  @override
  _LoanCalculatorViewState createState() => _LoanCalculatorViewState();
}

class _LoanCalculatorViewState extends State<LoanCalculatorView> {
  final LoanController controller = Get.find();
  double amount = 30000;
  int tenure = 40;

  double calculateEMI(double principal, double rate, int days) {
    double dailyRate = rate / 100; // 1% per day
    double interest = (principal * dailyRate * days);
    return interest;
  }

  @override
  Widget build(BuildContext context) {
    double interest = calculateEMI(amount, 1, tenure); // Example: 1% daily
    double totalPayable = amount + interest;

    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Column(
        children: [
          const SizedBox(height: 60),

          /// 🔹 Top Logo + Text
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/Group.png',
                height: 48,
              ),
              const SizedBox(width: 8),
              RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: "Credit",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w600,
                        color: Colors.blue,
                      ),
                    ),
                    TextSpan(
                      text: "Sea",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w100,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          /// 🔹 Custom BottomSheet UI
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6,
                  )
                ],
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Title
                  Row(
                    children: [
                      Icon(Icons.arrow_back, color: Colors.black),
                      const SizedBox(width: 8),
                      Text(
                        "Apply for loan",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),

                  const SizedBox(height: 8),
                  Text(
                    "We’ve calculated your loan eligibility. Select your preferred loan amount and tenure.",
                    style: TextStyle(color: Colors.black54),
                  ),

                  const SizedBox(height: 20),

                  /// Interest + Processing Fee
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.blue.shade100),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                            child: Text("Interest Per Day 1%"),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.blue.shade100),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                            child: Text("Processing Fee 10%"),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  /// Purpose Dropdown
                  Text("Purpose of Loan*", style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    items: ["Education", "Business", "Medical"].map((e) {
                      return DropdownMenuItem(value: e, child: Text(e));
                    }).toList(),
                    onChanged: (v) {},
                  ),

                  const SizedBox(height: 20),

                  /// Amount Slider
                  Text("Principal Amount"),
                  Slider(
                    value: amount,
                    min: 10000,
                    max: 100000,
                    divisions: 9,
                    onChanged: (v) => setState(() => amount = v),
                  ),
                  Text("₹ ${amount.toInt()}"),

                  const SizedBox(height: 20),

                  /// Tenure Slider
                  Text("Tenure"),
                  Slider(
                    value: tenure.toDouble(),
                    min: 20,
                    max: 45,
                    divisions: 25,
                    onChanged: (v) => setState(() => tenure = v.toInt()),
                  ),
                  Text("$tenure Days"),

                  const SizedBox(height: 20),

                  /// Calculation Box
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _rowText("Principal Amount", "₹${amount.toInt()}"),
                        _rowText("Interest", "1%"),
                        _rowText("Total Payable", "₹${totalPayable.toStringAsFixed(0)}"),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  Text(
                    "Thank you for choosing CreditSea. Please accept to proceed with the loan details.",
                    style: TextStyle(color: Colors.blue),
                  ),

                  Spacer(),

                  /// Bottom Buttons
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            controller.applyLoan(amount.toInt(), tenure);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            padding: EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Text("Apply"),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () => Get.off(() => OfferView()),// 👈 OfferScreen pe jaayega
                          style: OutlinedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Text("Cancel"),
                        ),

                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _rowText(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Text(value, style: TextStyle(color: Colors.blue)),
        ],
      ),
    );
  }
}
