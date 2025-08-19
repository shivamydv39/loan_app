import 'package:creditsea_app/app/views/pan_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/PersonalDetailsForm.dart';
import '../widgets/stepper.dart';

class PersonalDetailsView extends StatefulWidget {
  @override
  State<PersonalDetailsView> createState() => _PersonalDetailsViewState();
}

class _PersonalDetailsViewState extends State<PersonalDetailsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 53), // top space diya
            child: StepperHeader(currentStep: 1),
          ),
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
                children: [
                  // Form scrollable
                  Expanded(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.all(16),
                      child: PersonalDetailsForm(
                        // 👈 agar aap form ke andar ka button hata rahe ho
                      ),
                    ),
                  ),

                  // Continue button bottom pe fixed
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
                            Get.to(() => PanDetails());
                          },
                          child: Text("Continue", style: TextStyle(fontSize: 16)),
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
