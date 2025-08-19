import 'package:get/get.dart';
import '../views/login_view.dart';
import '../views/home_view.dart';
import '../views/profile_view.dart';
import '../views/loan_calculator_view.dart';
import '../views/loan_status_view.dart';
import '../views/splash_screen.dart';
import 'app_routes.dart';

class AppPages {
  static final initial = Routes.splash;

  static final routes = [
    GetPage(name: Routes.splash, page: () => SplashScreen()),
    GetPage(name: Routes.LOGIN, page: () => LoginView()),
    GetPage(name: Routes.HOME, page: () => HomeView()),
    GetPage(name: Routes.PROFILE, page: () => PersonalDetailsView()),
    GetPage(name: Routes.LOAN_CALCULATOR, page: () => LoanCalculatorView()),
    GetPage(name: Routes.LOAN_STATUS, page: () => LoanStatusView()),

  ];
}