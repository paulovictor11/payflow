import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/boleto_list/boleto_list.dart';
import 'package:payflow/shared/widgets/boleto_list/boleto_list_controller.dart';

class ExtractPage extends StatefulWidget {
  const ExtractPage({ Key? key }) : super(key: key);

  @override
  _ExtractPageState createState() => _ExtractPageState();
}

class _ExtractPageState extends State<ExtractPage> {

  final controller = new BoletoListController();

  @override
  Widget build(BuildContext context) {
    return new SingleChildScrollView(
      child: new Column(
        children: [
          new Container(
            color:  AppColors.primary,
            height: 40,
            width: double.maxFinite,
          ),
          new SizedBox(height: 24),
          new Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: new Row(
              children: [
                new Text(
                  'Meu extratos',
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
          new Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: new BoletoList(controller: controller),
          )
        ],
      ),
    );
  }
}