import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_images.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';

class SocialLoginButton extends StatelessWidget {

  final VoidCallback onTap;
  
  const SocialLoginButton({
    Key? key,
    required this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new InkWell(
      onTap: onTap,
      child: new Container(
        height: 56,
        decoration: new BoxDecoration(
          color: AppColors.shape,
          borderRadius: BorderRadius.circular(5),
          border: Border.fromBorderSide(
            new BorderSide(color: AppColors.stroke)
          )
        ),
        child: new Row(
          children: [
            new Expanded(
              child: Image.asset(AppImages.google)
            ),
            _verticalDivider(),
            new Expanded(
              flex: 4,
              child: new Center(
                child: new Text(
                  'Entrar com Google',
                  style: AppTextStyles.buttonGray,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _verticalDivider() => new Container(
    height: 56, width: 1,
    color: AppColors.stroke,
  );
}