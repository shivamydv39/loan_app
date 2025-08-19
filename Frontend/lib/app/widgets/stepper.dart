import 'package:flutter/material.dart';

class StepperHeader extends StatelessWidget {
  final int currentStep; // 1, 2, ya 3

  const StepperHeader({super.key, required this.currentStep});

  Widget buildStep(int step, String title, bool isActive) {
    return Row(
      children: [
        CircleAvatar(
          radius: 16,
          backgroundColor: isActive ? Colors.blue : Colors.grey.shade300,
          child: Text(
            "$step",
            style: TextStyle(
              color: isActive ? Colors.white : Colors.black54,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(width: 1),
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            color: isActive ? Colors.blue : Colors.black54,
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildStep(1, "Register", currentStep == 1),
          buildStep(2, "Offer", currentStep == 2),
          buildStep(3, "Approval", currentStep == 3),
        ],
      ),
    );
  }
}
