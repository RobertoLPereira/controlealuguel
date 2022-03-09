import 'package:controlealuguel/src/models/apoio/faixadeconsumo.dart';
import 'package:flutter/material.dart';

import 'faixadeconsumo_detal_back.dart';

class FaixadeconsumoDetails extends StatelessWidget {
  showModalError(BuildContext context) {
    var alert = AlertDialog(
      title: Text('Alerta!'),
      content: Text('Não foi possível encontrar um APP compatível.'),
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }

  @override
  Widget build(BuildContext context) {
    var _back = FaixadeconsumoDetailsBack(context);
    Faixadeconsumo faixadeconsumo = _back.faixadeconsumo;

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        var width = constraints.biggest.width;
        // ignore: unused_local_variable
        var radius = width / 3;
        // var height = constraints.biggest.height;

        return Scaffold(
          body: ListView(
            padding: EdgeInsets.all(60),
            children: [
              IconButton(
                icon: Icon(Icons.stairs),
                color: Colors.green,
                onPressed: () {},
              ),
              //definicao dos campos do formulario de detalhe
              Center(
                child: Text(
                  'Id: ${faixadeconsumo.idfaixadeconsumo}',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Center(
                child: Text(
                  'Denominação: ${faixadeconsumo.denominacao}',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Center(
                child: Text(
                  'De: ${faixadeconsumo.faixainicial}',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Center(
                child: Text(
                  'Até: ${faixadeconsumo.faixafinal}',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Center(
                child: Text(
                  'Tarifa água: ${faixadeconsumo.tarifaagua}',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Center(
                child: Text(
                  'Taxa de esgoto: ${faixadeconsumo.tarifaesgoto}',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Center(
                child: Text(
                  'tfdi: ${faixadeconsumo.tfdi}',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Center(
                child: Text(
                  'Categoria:${faixadeconsumo.idimovel}',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              FloatingActionButton(
                child: Icon(Icons.arrow_back),
                onPressed: () {
                  _back.goToBack();
                },
              )
            ],
          ),
        );
      },
    );
  }
}
