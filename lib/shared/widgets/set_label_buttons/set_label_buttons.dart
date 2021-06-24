import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/divider_vertical/divider_vertical.dart';
import 'package:payflow/shared/widgets/label_button/label_button.dart';

class SetLabelButtons extends StatelessWidget {

  final String primaryLabel;
  final VoidCallback primaryOnTap;
  final String secondaryLabel;
  final VoidCallback secondaryOnTap;
  final bool enablePrimaryColor;

  const SetLabelButtons({
    Key? key,
    required this.primaryLabel,
    required this.primaryOnTap,
    required this.secondaryLabel,
    required this.secondaryOnTap,
    this.enablePrimaryColor = false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
      color: AppColors.shape,
      height: 56,
      child: new Row(
        children: [
          new Expanded(
            child: new LabelButton(
              label: primaryLabel,
              style: enablePrimaryColor ? AppTextStyles.buttonPrimary : null,
              onTap: primaryOnTap,
            ),
          ),
          new DividerVertical(),
          new Expanded(
            child: new LabelButton(
              label: secondaryLabel,
              onTap: secondaryOnTap,
            ),
          )
        ],
      ),
    );
  }
}