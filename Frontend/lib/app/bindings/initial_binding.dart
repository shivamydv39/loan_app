import 'package:get/get.dart';
import '../controllers/auth_controller.dart';
import '../controllers/user_controller.dart';
import '../controllers/loan_controller.dart';
import '../services/api_service.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ApiService());
    Get.put(AuthController());
    Get.put(UserController());
    Get.put(LoanController());
  }
}