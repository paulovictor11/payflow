import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_images.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';

class BoletoInfo extends StatelessWidget {
  final int size;

  const BoletoInfo({
    Key? key,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
      decoration: new BoxDecoration(
        color: AppColors.secondary,
        borderRadius: BorderRadius.circular(5)
      ),
      child: new Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              AppImages.logomini,
              color: AppColors.background,
              height: 34, width: 56,
            ),
            new Container(
              width: 1, height: 32,
              color: AppColors.background,
            ),
            Text.rich(
              new TextSpan(
                text: "Você tem ",
                style: AppTextStyles.captionBackground,
                children: [
                  new TextSpan(
                    text: "$size boletos\n",
                    style: AppTextStyles.captionBoldBackground,
                  ),
                  new TextSpan(
                    text: "cadastrados para pagar",
                    style: AppTextStyles.captionBackground,
                  ),
                ],
              )
            )
          ],
        ),
      ),
    );
  }
}
