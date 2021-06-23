import 'package:flutter/material.dart';
import 'package:payflow/modules/login/login_controller.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_images.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/social_login/social_login_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final controller = new LoginController();

    return new Scaffold(
      backgroundColor: AppColors.background,
      body: new Container(
        width: size.width,
        height: size.height,
        child: new Stack(
          children: [
            new Container(
              width: size.width,
              height: size.height * 0.36,
              color: AppColors.primary,
            ),
            new Positioned( 
              left: 0, right: 0, top: 40,
              child: Image.asset(
                AppImages.person,
                width: 208, height: 373,
              ),
            ),
            new Positioned(
              bottom: 64, left: 0, right: 0,
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AppImages.logomini),
                  new SizedBox(height: 30),
                  new Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 80),
                    child: new Text(
                      'Organize seus boletos em um só lugar',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.titleHome,
                    ),
                  ),
                  new SizedBox(height: 40),
                  new Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: new SocialLoginButton(
                      onTap: () => controller.googleSignIn(context),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}