import 'package:creditsea_app/app/views/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../controllers/auth_controller.dart';
import '../widgets/OnboardItem.dart';
import '../widgets/primary_textfield.dart';
import '../widgets/primary_button.dart';
import '../utils/app_colors.dart';
import 'dart:async';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final RxInt secondsRemaining = 30.obs;
  Timer? _timer;
  final RxInt stepIndex = 0.obs;

  final AuthController authController = Get.find<AuthController>();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController otpController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final PageController _pageController = PageController();
  final RxInt currentPage = 0.obs;

  final FocusNode mobileFocus = FocusNode();
  final FocusNode otpFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();
  final FocusNode confirmPasswordFocus = FocusNode();

  void _startTimer() {
    secondsRemaining.value = 30;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (secondsRemaining.value > 0) {
        secondsRemaining.value--;
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    mobileFocus.dispose();
    otpFocus.dispose();
    passwordFocus.dispose();
    confirmPasswordFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBlue,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/Group.png', height: 48),
                const SizedBox(width: 1),
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
            const SizedBox(height: 32),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: PageView(
                      controller: _pageController,
                      onPageChanged: (index) {
                        currentPage.value = index;
                      },
                      children: const [
                        OnboardItem(
                          icon: Icons.directions_car,
                          title: "Flexible Loan Options",
                          subtitle:
                              "Loan types to cater to different financial needs",
                        ),
                        OnboardItem(
                          icon: Icons.verified,
                          title: "Instant Loan Approval",
                          subtitle:
                              "Users will receive approval within minutes",
                        ),
                        OnboardItem(
                          icon: Icons.support_agent,
                          title: "24x7 Customer Care",
                          subtitle: "Dedicated customer support team",
                        ),
                        OnboardItem(
                          icon: Icons.security,
                          title: "Safe & Secure",
                          subtitle: "Your data is encrypted and protected",
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  SmoothPageIndicator(
                    controller: _pageController,
                    count: 4,
                    effect: const ExpandingDotsEffect(
                      activeDotColor: Colors.white,
                      dotColor: Colors.white54,
                      dotHeight: 8,
                      dotWidth: 8,
                      expansionFactor: 3,
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
            Obx(() {
              switch (stepIndex.value) {
                case 0:
                  return _buildMobileSheet();
                case 1:
                  return _buildOtpSheet();
                case 2:
                  return _buildPasswordSheet();
                case 3:
                  return _buildMobileSheete();
                default:
                  return _buildMobileSheet();
              }
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildMobileSheet() {
    return _buildBottomContainerCustom(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Welcome to Credit Sea!",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text("Mobile Number",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Image.asset('assets/images/image 1.png', height: 20),
                    const SizedBox(width: 6),
                    const Text("+91",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500)),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: PrimaryTextField(
                  label: '',
                  hint: 'Please enter your mobile no.',
                  controller: mobileController,
                  keyboardType: TextInputType.phone,
                  focusNode: mobileFocus,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(otpFocus);
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(() => Checkbox(
                    value: authController.isAgreed.value,
                    onChanged: (val) {
                      authController.isAgreed.value = val ?? false;
                    },
                  )),
              Expanded(
                child: RichText(
                  text: const TextSpan(
                    style: TextStyle(color: Colors.black, fontSize: 12),
                    children: [
                      TextSpan(text: "By continuing, you agree to our "),
                      TextSpan(
                          text: "privacy policies",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.underline)),
                      TextSpan(text: " and "),
                      TextSpan(
                          text: "Terms & Conditions.",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.underline)),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          PrimaryButton(
            text: "Request OTP",
            onPressed: () async {
              if (mobileController.text.trim().isEmpty) {
                Get.snackbar("Error", "Please enter mobile number");
              } else if (!authController.isAgreed.value) {
                Get.snackbar("Error", "Please accept terms & conditions");
              } else {
                bool success =
                    await authController.sendOtp(mobileController.text.trim());
                if (success) {
                  Get.snackbar("OTP", "OTP sent successfully");
                  stepIndex.value = 1;
                } else {
                  Get.snackbar("Error", "Failed to send OTP. Try again!");
                }
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildOtpSheet() {
    if (_timer == null || !_timer!.isActive) {
      _startTimer();
    }
    return _buildBottomContainerCustom(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 8),
          const Text("Enter OTP",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          const SizedBox(height: 8),
          Text("Verify OTP, Sent on +91 ${mobileController.text}",
              style:
                  const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
          const SizedBox(height: 20),
          PinCodeTextField(
            appContext: Get.context!,
            length: 4,
            controller: otpController,
            focusNode: otpFocus,
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
            onSubmitted: (_) {
              FocusScope.of(context).requestFocus(passwordFocus);
            },
            animationType: AnimationType.fade,
            pinTheme: PinTheme(
              shape: PinCodeFieldShape.box,
              borderRadius: BorderRadius.circular(8),
              fieldHeight: 50,
              fieldWidth: 50,
              activeFillColor: Colors.white,
              selectedFillColor: Colors.white,
              inactiveFillColor: Colors.white,
              inactiveColor: Colors.grey,
              selectedColor: Colors.blue,
              activeColor: Colors.blue,
            ),
            enableActiveFill: true,
            onChanged: (value) {},
          ),
          const SizedBox(height: 12),
          Obx(() {
            return secondsRemaining.value > 0
                ? Text(
                    "00:${secondsRemaining.value.toString().padLeft(2, '0')}",
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w500))
                : TextButton(
                    onPressed: () {
                      _startTimer();
                      Get.snackbar("OTP", "OTP resent successfully!");
                    },
                    child: const Text("Resend OTP",
                        style: TextStyle(color: Colors.blue)),
                  );
          }),
          const SizedBox(height: 20),
          PrimaryButton(
            text: "Verify",
            onPressed: () async {
              if (otpController.text.length != 4) {
                Get.snackbar("Error", "Please enter valid 4-digit OTP");
              } else {
                bool verified = await authController.verifyOtp(
                    mobileController.text.trim(), otpController.text.trim());
                if (verified) {
                  stepIndex.value = 2;
                } else {
                  Get.snackbar("Error", "Invalid OTP or verification failed!");
                }
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildPasswordSheet() {
    return _buildBottomContainer(
      title: "Create a password",
      child: Column(
        children: [
          PrimaryTextField(
            label: 'Enter password',
            hint: 'Enter password',
            controller: passwordController,
            obscureText: true,
            focusNode: passwordFocus,
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (_) {
              FocusScope.of(context).requestFocus(confirmPasswordFocus);
            },
            suffix: const Icon(Icons.visibility_off),
          ),
          const SizedBox(height: 16),
          PrimaryTextField(
            label: 'Re-enter password',
            hint: 'Re-enter password',
            controller: confirmPasswordController,
            obscureText: true,
            focusNode: confirmPasswordFocus,
            textInputAction: TextInputAction.done,
            onFieldSubmitted: (_) {
              FocusScope.of(context).unfocus();
              _submitPassword();
            },
          ),
        ],
      ),
      buttonText: "Sign In",
      onPressed: _submitPassword,
    );
  }

  void _submitPassword() {
    if (passwordController.text.trim().isEmpty ||
        confirmPasswordController.text.trim().isEmpty) {
      Get.snackbar("Error", "Please fill both password fields");
    } else if (passwordController.text != confirmPasswordController.text) {
      Get.snackbar("Error", "Passwords do not match");
    } else {
      Get.snackbar("Success", "Signed in successfully!");
      Future.delayed(const Duration(seconds: 1), () {
        Get.offAll(() => PersonalDetailsView());
      });
    }
  }

  Widget _buildMobileSheete() {
    return _buildBottomContainerCustom(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Welcome Back!",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Image.asset('assets/images/image 1.png', height: 20),
                    const SizedBox(width: 6),
                    const Text("+91",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500)),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: PrimaryTextField(
                  label: '',
                  hint: 'Please enter your mobile no.',
                  controller: mobileController,
                  keyboardType: TextInputType.phone,
                  focusNode: mobileFocus,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(passwordFocus);
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          PrimaryTextField(
            label: 'Password',
            hint: 'Enter password',
            controller: passwordController,
            obscureText: true,
            focusNode: passwordFocus,
            textInputAction: TextInputAction.done,
            onFieldSubmitted: (_) {
              FocusScope.of(context).unfocus();
              _submitPassword();
            },
            suffix: const Icon(Icons.visibility_off),
          ),
          const SizedBox(height: 16),
          PrimaryButton(text: "Sign In", onPressed: _submitPassword),
        ],
      ),
    );
  }

  Widget _buildBottomContainer({
    required String title,
    required Widget child,
    required String buttonText,
    required VoidCallback onPressed,
  }) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8)],
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(title,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          const SizedBox(height: 16),
          child,
          const SizedBox(height: 20),
          PrimaryButton(text: buttonText, onPressed: onPressed),
        ],
      ),
    );
  }

  Widget _buildBottomContainerCustom({required Widget child}) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8)],
      ),
      padding: const EdgeInsets.all(24),
      child: child,
    );
  }
}
