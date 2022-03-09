import 'package:controlealuguel/src/models/apoio/categorias.dart';

import 'package:flutter/material.dart';
import 'categoria_de_imoveis_details_back.dart';

class CategoriasDetails extends StatelessWidget {
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
    final _back = CategoriaDetailsBack(context);
    Categorias categ = _back.categ;

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Scaffold(
          body: ListView(
            padding: EdgeInsets.all(60),
            children: [
              Center(
                child: Text(
                  categ.idcategoriadeimoveis.toString() +
                      ' - ' +
                      categ.denominacao,
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.arrow_back),
            onPressed: () {
              _back.goToBack();
            },
          ),
        );
      },
    );
  }
}
