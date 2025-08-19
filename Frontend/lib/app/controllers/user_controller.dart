import 'package:get/get.dart';
import '../services/api_service.dart';
import '../models/user.dart';

class UserController extends GetxController {
  final ApiService _api = Get.find<ApiService>();
  Rx<User?> user = Rx<User?>(null);

  Future<void> fetchProfile() async {
    final data = await _api.getProfile();
    if (data != null) {
      user.value = User.fromJson(data);
    }
  }

  Future<bool> updateProfile(User updatedUser) async {
    final response = await _api.updateProfile(updatedUser);
    if (response != null) {
      user.value = User.fromJson(response['user']);
      return true;
    }
    return false;
  }
}