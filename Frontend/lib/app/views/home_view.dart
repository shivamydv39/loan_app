import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';
import '../routes/app_routes.dart';

class HomeView extends StatelessWidget {
  final AuthController auth = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CreditSea Home'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              auth.logout();
              Get.offAllNamed(Routes.LOGIN);
            },
          )
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(24),
        children: [
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Profile'),
            onTap: () => Get.toNamed(Routes.PROFILE),
          ),
          ListTile(
            leading: Icon(Icons.calculate),
            title: Text('Loan Calculator'),
            onTap: () => Get.toNamed(Routes.LOAN_CALCULATOR),
          ),
          ListTile(
            leading: Icon(Icons.track_changes),
            title: Text('Loan Status'),
            onTap: () => Get.toNamed(Routes.LOAN_STATUS),
          ),
        ],
      ),
    );
  }
}