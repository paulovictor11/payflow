import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';

class LabelButton extends StatelessWidget {
  
  final String label;
  final VoidCallback onTap;
  final TextStyle? style;
  const LabelButton({
    Key? key,
    required this.label,
    required this.onTap,
    this.style
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 56,
      child: new TextButton(
        onPressed: onTap,
        child: new Text(
          label,
          style: style ?? AppTextStyles.buttonHeading,
        ),
      ),
    );
  }
}