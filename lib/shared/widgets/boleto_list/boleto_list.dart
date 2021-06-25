import 'package:flutter/material.dart';

import 'package:payflow/shared/models/boleto_model.dart';
import 'package:payflow/shared/widgets/boleto_list/boleto_list_controller.dart';
import 'package:payflow/shared/widgets/boleto_tile/boleto_tile.dart';

class BoletoList extends StatefulWidget {

  final BoletoListController controller;

  const BoletoList({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  _BoletoListState createState() => _BoletoListState();
}

class _BoletoListState extends State<BoletoList> {
  @override
  Widget build(BuildContext context) {
    return new ValueListenableBuilder<List<Boleto>>(
      valueListenable: widget.controller.boletosNotifier, 
      builder: (_, boletos, __) => new Column(
        children: widget.controller.boletos.map((e) => new BoletoTile(data: e)).toList()
      )
    );
  }
}