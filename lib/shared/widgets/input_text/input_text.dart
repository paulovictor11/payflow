import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';

class InputText extends StatelessWidget {
  final String label;
  final IconData icon;
  final String? initialValue;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final void Function(String value) onChanged;

  const InputText({
    Key? key,
    required this.label,
    required this.icon,
    this.initialValue,
    this.validator,
    this.controller,
    required this.onChanged
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new AnimatedCard(
      direction: AnimatedCardDirection.left,
      child: new Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: new Column(
          children: [
            new TextFormField(
              controller: controller,
              onChanged: onChanged,
              initialValue: initialValue,
              validator: validator,
              style: AppTextStyles.input,
              decoration: new InputDecoration(
                contentPadding: EdgeInsets.zero,
                labelText: label,
                labelStyle: AppTextStyles.input,
                icon: new Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    new Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: new Icon(
                        icon,
                        color: AppColors.primary,
                      ),
                    ),
                    new Container(
                      width: 1, height: 48,
                      color: AppColors.stroke,
                    )
                  ],
                ),
                border: InputBorder.none
              ),
            ),
            new Divider(
              height: 1,
              thickness: 1,
              color: AppColors.stroke,
            )
          ],
        ),
      ),
    );
  }
}