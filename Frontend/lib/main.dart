import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'app/routes/app_pages.dart';
import 'app/bindings/initial_binding.dart';
import 'app/utils/app_theme.dart';
import 'app/controllers/auth_controller.dart';
import 'app/views/login_view.dart';
import 'app/views/profile_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  InitialBinding().dependencies();
  runApp(const CreditSeaApp());
}

class CreditSeaApp extends StatelessWidget {
  const CreditSeaApp({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.put(AuthController());

    return GetMaterialApp(
      title: 'CreditSea',
      theme: appTheme,
      initialBinding: InitialBinding(),
      debugShowCheckedModeBanner: false,


      home: Obx(() {
        if (authController.isLoggedIn.value) {
          return PersonalDetailsView();
        } else {
          return const LoginView();
        }
      }),

      getPages: AppPages.routes,
    );
  }
}
