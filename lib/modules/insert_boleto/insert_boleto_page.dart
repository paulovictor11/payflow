import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:payflow/modules/insert_boleto/insert_boleto_controller.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/input_text/input_text.dart';
import 'package:payflow/shared/widgets/set_label_buttons/set_label_buttons.dart';

class InsertBoletoPage extends StatefulWidget {

  final String? barcode;

  const InsertBoletoPage({ Key? key, this.barcode }) : super(key: key);

  @override
  _InsertBoletoPageState createState() => _InsertBoletoPageState();
}

class _InsertBoletoPageState extends State<InsertBoletoPage> {

  final controller = new InsertBoletoController();

  final moneyController = new MoneyMaskedTextController(leftSymbol: 'R\$', decimalSeparator: ',');
  final dueDateController = new MaskedTextController(mask: '00/00/0000');
  final barcodeController = new TextEditingController();

  @override
  void initState() {
    if (widget.barcode != null) {
      barcodeController.text = widget.barcode!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: AppColors.background,
      appBar: new AppBar(
        leading: new BackButton(color: AppColors.input),
        backgroundColor: AppColors.background,
        elevation: 0,
      ),
      body: new SingleChildScrollView(
        child: new Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              new Padding(
                padding: const EdgeInsets.symmetric(horizontal: 93),
                child: new Text(
                  'Preencher os dados do boleto',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.titleBoldHeading,
                ),
              ),
              new SizedBox(height: 24),
              new Form(
                key: controller.formKey,
                child: new Column(
                  children: [
                    new InputText(
                    label: 'Nome do Boleto',
                    icon: Icons.description_outlined,
                    onChanged: (value) => controller.onChange(name: value),
                    validator: controller.validateName,
                  ),
                  new InputText(
                    controller: dueDateController,
                    label: 'Vencimento',
                    icon: FontAwesomeIcons.timesCircle,
                    onChanged: (value) => controller.onChange(dueDate: value),
                    validator: controller.validateVencimento,
                  ),
                  new InputText(
                    controller: moneyController,
                    label: 'Valor',
                    icon: FontAwesomeIcons.wallet,
                    onChanged: (_) => controller.onChange(value: moneyController.numberValue),
                    validator: (_) => controller.validateValor(moneyController.numberValue),
                  ),
                  new InputText(
                    controller: barcodeController,
                    label: 'Código',
                    icon: FontAwesomeIcons.barcode,
                    onChanged: (value) => controller.onChange(barcode: value),
                    validator: controller.validateCodigo,
                  ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: new SetLabelButtons(
        primaryLabel: 'Cancelar',
        primaryOnTap: () => Navigator.of(context).pop(),
        secondaryLabel: 'Cadastrar',
        secondaryOnTap: () async {
          await controller.cadastrarBoleto();
          Navigator.of(context).pop();
        },
        enableSecondaryColor: true,
      ),
    );
  }
}