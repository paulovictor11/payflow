import 'package:flutter/material.dart';
import 'package:payflow/modules/login/login_page.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_images.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({ Key? key }) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  void _splashTime() => Future.delayed(
    new Duration(seconds: 5)
  ).then((_) => Navigator.of(context).pushReplacement(
    new MaterialPageRoute(builder: (_) => LoginPage())
  ));

  @override
  void initState() {
    _splashTime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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