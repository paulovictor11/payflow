import 'package:flutter/material.dart';
import 'package:payflow/shared/auth/auth_controller.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_images.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({ Key? key }) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    final authController = new AuthController();
    authController.currentUser(context);

    return new Scaffold(
      backgroundColor: AppColors.background,
      body: new Stack(
        children: [
          new Center(child: Image.asset(AppImages.union)),
          new Center(child: Image.asset(AppImages.logoFull)),
        ],
      ),
    );
  }
}