import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:payflow/shared/models/boleto_model.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/boleto_info/boleto_info.dart';
import 'package:payflow/shared/widgets/boleto_list/boleto_list.dart';
import 'package:payflow/shared/widgets/boleto_list/boleto_list_controller.dart';

class MeusBoletosPage extends StatefulWidget {
  const MeusBoletosPage({ Key? key }) : super(key: key);

  @override
  _MeusBoletosPageState createState() => _MeusBoletosPageState();
}

class _MeusBoletosPageState extends State<MeusBoletosPage> {

  final controller = new BoletoListController();

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: [
        new Stack(
          children: [
            new Container(
              color:  AppColors.primary,
              height: 40,
              width: double.maxFinite,
            ),
            new Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: new ValueListenableBuilder<List<Boleto>>(
                valueListenable: controller.boletosNotifier,
                builder: (_, boletos, __) => new AnimatedCard(
                  direction: AnimatedCardDirection.top,
                  child: new BoletoInfo(size: boletos.length),
                )
              ),
            )
          ],
        ),
        new SizedBox(height: 24),
        new Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: new Row(
            children: [
              new Text(
                'Meus Boletos',
                style: AppTextStyles.titleBoldHeading,
              ),
            ],
          ),
        ),
        new Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
          child: new Divider(
            thickness: 1,
            height: 1,
            color: AppColors.stroke,
          ),
        ),
        new SingleChildScrollView(
          child: new Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: new BoletoList(controller: controller),
          ),
        )
      ],
    );
  }
}