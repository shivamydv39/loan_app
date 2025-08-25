import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user.dart';

class ApiService {
  static const baseUrl = 'https://loan-app-v819.vercel.app/api';
  String? _token;

  void setToken(String token) => _token = token;
  void clearToken() => _token = null;

  Future<Map<String, dynamic>> sendOtp(String mobile) async {
    final res = await http.post(
      Uri.parse('$baseUrl/auth/otp'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'mobile': mobile}),
    );
    print("sendOtp => ${res.statusCode}: ${res.body}");
    return jsonDecode(res.body);
  }

  Future<Map<String, dynamic>?> verifyOtp(String mobile, String otp) async {
    final res = await http.post(
      Uri.parse('$baseUrl/auth/verify'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'mobile': mobile, 'otp': otp}),
    );
    print("verifyOtp => ${res.statusCode}: ${res.body}");

    if (res.statusCode == 200) {
      final data = jsonDecode(res.body);
      if (data['token'] != null) {
        setToken(data['token']);
      }
      return data;
    }
    return null;
  }


  Future<Map<String, dynamic>?> getProfile() async {
    if (_token == null) {
      print("Error: Token is null. User not authenticated.");

      return null;
    }
    print("Attempting to get profile with token: $_token");

    final res = await http.get(
      Uri.parse('$baseUrl/user/profile'),
      headers: {
        'Authorization': 'Bearer $_token',
        'Content-Type': 'application/json',
      },
    );
    print("getProfile => ${res.statusCode}: ${res.body}");

    if (res.statusCode == 200) {
      return jsonDecode(res.body);
    } else {

      print("Error fetching profile: ${res.statusCode} - ${res.body}");
      // You could throw an exception here:
      // throw Exception('Failed to load profile: ${res.statusCode} ${res.body}');
      return null;
    }
  }


  Future<Map<String, dynamic>?> updateProfile(User user) async {
    final res = await http.post(
      Uri.parse('$baseUrl/user/profile'),
      headers: {
        'Authorization': 'Bearer $_token',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(user.toJson()),
    );
    print("updateProfile => ${res.statusCode}: ${res.body}");
    if (res.statusCode == 200) return jsonDecode(res.body);
    return null;
  }

  Future<Map<String, dynamic>?> applyLoan(int amount, int tenure) async {
    final res = await http.post(
      Uri.parse('$baseUrl/loan/apply'),
      headers: {
        'Authorization': 'Bearer $_token',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({'amount': amount, 'tenure': tenure}),
    );
    print("applyLoan => ${res.statusCode}: ${res.body}");
    if (res.statusCode == 200) return jsonDecode(res.body);
    return null;
  }

  Future<List<dynamic>?> getLoanStatus() async {
    final res = await http.get(
      Uri.parse('$baseUrl/loan/status'),
      headers: {'Authorization': 'Bearer $_token'},
    );
    print("getLoanStatus => ${res.statusCode}: ${res.body}");
    if (res.statusCode == 200) return jsonDecode(res.body);
    return null;
  }
}