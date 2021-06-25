import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';

import 'package:payflow/shared/models/boleto_model.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';

class BoletoTile extends StatelessWidget {

  final Boleto data;

  const BoletoTile({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new AnimatedCard(
      direction: AnimatedCardDirection.right,
      child: new ListTile(
        contentPadding: EdgeInsets.zero,
        title: new Text(
          data.name!,
          style: AppTextStyles.titleListTile,
        ),
        subtitle: new Text(
          'Vence em ${data.dueDate}',
          style: AppTextStyles.captionBody,
        ),
        trailing: Text.rich(TextSpan(
          text: "R\$ ",
          style: AppTextStyles.trailingRegular,
          children: [
            new TextSpan(
              text: "${data.value!.toStringAsFixed(2)}",
              style: AppTextStyles.trailingBold,
            ),
          ],
        )),
      ),
    );
  }
}
