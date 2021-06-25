import 'package:flutter/cupertino.dart';
import 'package:payflow/shared/models/boleto_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BoletoListController {
  final boletosNotifier = ValueNotifier<List<Boleto>>(<Boleto>[]);
  List<Boleto> get boletos => boletosNotifier.value;
  set boletos(List<Boleto> value) => boletosNotifier.value = value;

  BoletoListController() {
    getBoletos();
  }

  Future<void> getBoletos() async {
    try {
      final instance = await SharedPreferences.getInstance();
      final response = instance.getStringList('boletos') ?? <String>[];
      boletos = response.map((e) => Boleto.fromJson(e)).toList();
    } catch (e) {
      boletos = <Boleto>[];
    }
  }
}