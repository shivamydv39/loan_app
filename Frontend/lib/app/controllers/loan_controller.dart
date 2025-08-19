import 'package:get/get.dart';
import '../services/api_service.dart';
import '../models/loan_application.dart';

class LoanController extends GetxController {
  final ApiService _api = Get.find<ApiService>();
  RxList<LoanApplication> loans = <LoanApplication>[].obs;

  Future<bool> applyLoan(int amount, int tenure) async {
    final response = await _api.applyLoan(amount, tenure);
    if (response != null) {
      loans.add(LoanApplication.fromJson(response['loanApp']));
      return true;
    }
    return false;
  }

  Future<void> fetchLoanStatus() async {
    final data = await _api.getLoanStatus();
    if (data != null) {
      loans.value = List<LoanApplication>.from(
        (data).map((e) => LoanApplication.fromJson(e)),
      );
    }
  }
}