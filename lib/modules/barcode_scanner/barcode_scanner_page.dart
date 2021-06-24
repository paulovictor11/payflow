import 'package:flutter/material.dart';
import 'package:payflow/modules/barcode_scanner/barcode_scanner_controller.dart';
import 'package:payflow/modules/barcode_scanner/barcode_scanner_status.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/bottom_sheet/bottom_sheet.dart';
import 'package:payflow/shared/widgets/set_label_buttons/set_label_buttons.dart';

class BarcodeScannerPage extends StatefulWidget {
  const BarcodeScannerPage({ Key? key }) : super(key: key);

  @override
  _BarcodeScannerPageState createState() => _BarcodeScannerPageState();
}

class _BarcodeScannerPageState extends State<BarcodeScannerPage> {

  final controller = new BarcodeScannerController();

  @override
  void initState() {
    controller.getAvailableCameras();
    controller.statusNotifier.addListener(() {
      if (controller.status.hasBarcode) {
        Navigator.of(context).pushNamed('/boleto');
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new SafeArea(
      child: new Stack(
        children: [
          new ValueListenableBuilder<BarcodeScannerStatus>(
            valueListenable: controller.statusNotifier,
            builder: (_, status, __) {
              if (status.showCamera) {
                return new Container(
                  child: controller.cameraController!.buildPreview(),
                );
              } 

              return new Container();
            }
          ),
          new RotatedBox(
            quarterTurns: 1,
            child: new Scaffold(
              backgroundColor: Colors.transparent,
              appBar: new AppBar(
                backgroundColor: Colors.black,
                centerTitle: true,
                title: new Text(
                  'Escaneie o código de barras do boleto',
                  style: AppTextStyles.buttonBoldBackground,
                ),
                leading: new BackButton(color: AppColors.background),
              ),
              body: new Column(
                children: [
                  new Expanded(
                    child: new Container(color: Colors.black.withOpacity(0.6)),
                  ),
                  new Expanded(
                    flex: 2,
                    child: new Container(
                      color: Colors.transparent
                    ),
                  ),
                  new Expanded(
                    child: new Container(color: Colors.black.withOpacity(0.6)),
                  )
                ],
              ),
              bottomNavigationBar: new SetLabelButtons(
                primaryLabel: 'Inserir código do boleto',
                primaryOnTap: () {},
                secondaryLabel: 'Adicionar da galeria',
                secondaryOnTap: () {}
              ),
            ),
          ),
          new ValueListenableBuilder<BarcodeScannerStatus>(
            valueListenable: controller.statusNotifier,
            builder: (_, status, __) {
              if (status.hasError) {
                return new BottomSheetWidget(
                  title: 'Não foi possível identificar um código de barras.',
                  subtitle: 'tente escanear novamente ou digite o código de do seu boleto.',
                  primaryLabel: 'Escanear novamente',
                  primaryOnTap: () => controller.getAvailableCameras(),
                  secondaryLabel: 'Digitar código',
                  secondaryOnTap: () => Navigator.of(context).pushNamed('/boleto')
                );
              }

              return new Container();
            },
          )
        ],
      ),
    );
  }
}