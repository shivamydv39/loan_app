import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../services/api_service.dart';
import '../models/user.dart';

class AuthController extends GetxController {
  var isAgreed = false.obs;
  final ApiService _api = Get.find<ApiService>();
  final storage = GetStorage();

  Rx<User?> user = Rx<User?>(null);
  RxBool isLoggedIn = false.obs;
  RxString token = ''.obs;

  @override
  void onInit() {
    super.onInit();
    _loadUserSession();
  }

  // OTP bhejna
  Future<bool> sendOtp(String mobile) async {
    final response = await _api.sendOtp(mobile);
    return response['message'] == 'OTP sent';
  }

  // OTP verify karna
  Future<bool> verifyOtp(String mobile, String otp) async {
    final result = await _api.verifyOtp(mobile, otp);
    if (result != null && result['token'] != null) {
      token.value = result['token'];
      user.value = User.fromJson(result['user']);
      isLoggedIn.value = true;

      // token ko API service me set karo
      _api.setToken(token.value);

      // 🔹 local storage me save karo
      storage.write('token', token.value);
      storage.write('user', result['user']);
      storage.write('isLoggedIn', true);

      return true;
    }
    return false;
  }

  // Session load karna
  void _loadUserSession() {
    final savedToken = storage.read('token');
    final savedUser = storage.read('user');
    final loggedIn = storage.read('isLoggedIn') ?? false;

    if (loggedIn && savedToken != null && savedUser != null) {
      token.value = savedToken;
      user.value = User.fromJson(savedUser);
      isLoggedIn.value = true;
      _api.setToken(token.value);
    }
  }

  // Logout
  void logout() {
    user.value = null;
    token.value = '';
    isLoggedIn.value = false;
    _api.clearToken();

    // 🔹 storage clear karo
    storage.erase();
  }
}
