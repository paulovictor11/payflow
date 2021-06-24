import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/set_label_buttons/set_label_buttons.dart';

class BottomSheetWidget extends StatelessWidget {
  final String primaryLabel;
  final VoidCallback primaryOnTap;
  final String secondaryLabel;
  final VoidCallback secondaryOnTap;
  final String title;
  final String subtitle;

  const BottomSheetWidget({
    Key? key,
    required this.primaryLabel,
    required this.primaryOnTap,
    required this.secondaryLabel,
    required this.secondaryOnTap,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new SafeArea(
      child: new RotatedBox(
        quarterTurns: 1,
        child: new Material(
          child: new Container(
            color: AppColors.shape,
            child: new Column(
              children: [
                new Expanded(
                  child: new Container(color: Colors.black.withOpacity(0.6)),
                ),
                new Column(
                  children: [
                    new Padding(
                      padding: const EdgeInsets.all(40),
                      child: Text.rich(
                        new TextSpan(
                          text: title,
                          style: AppTextStyles.buttonBoldHeading,
                          children: [
                            new TextSpan(
                              text: '\n$subtitle',
                              style: AppTextStyles.buttonHeading
                            ),
                          ]
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    new Container(
                      height: 1,
                      color: AppColors.stroke,
                    ),
                    new SetLabelButtons(
                      primaryLabel: primaryLabel,
                      primaryOnTap: primaryOnTap,
                      secondaryLabel: secondaryLabel,
                      secondaryOnTap: secondaryOnTap,
                      enablePrimaryColor: true,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
