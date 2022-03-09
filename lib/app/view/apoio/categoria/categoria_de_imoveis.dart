import 'package:controlealuguel/src/models/apoio/categorias.dart';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'categoria_de_imoveis_back.dart';

class CategoriadeImoveisList extends StatelessWidget {
  final _back = CategoriadeimoveisListBack();

  Widget iconCircButton(Function onPressed) {
    return IconButton(
        icon: Icon(Icons.stairs), color: Colors.green, onPressed: onPressed);
  }

  Widget iconEditButton(Function onPressed) {
    return IconButton(
        icon: Icon(Icons.edit), color: Colors.orange, onPressed: onPressed);
  }

  Widget iconRemoveButton(BuildContext context, Function remove) {
    return IconButton(
        icon: Icon(Icons.delete),
        color: Colors.red,
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: Text('Excluir'),
                    content: Text('Confirma a Exclusão?'),
                    actions: [
                      // ignore: deprecated_member_use
                      FlatButton(
                        child: Text('Não'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      // ignore: deprecated_member_use
                      FlatButton(
                        child: Text('Sim'),
                        onPressed: remove(),
                      ),
                    ],
                  ));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Categoria de Imoveis'),
        actions: [
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                _back.goToForm(context);
              })
        ],
      ),
      body: Observer(builder: (context) {
        return FutureBuilder(
          future: _back.list,
          builder: (context, futuro) {
            if (!futuro.hasData) {
              return CircularProgressIndicator();
            } else {
              List<Categorias> lista = futuro.data as List<Categorias>;
              return ListView.builder(
                itemCount: lista.length,
                itemBuilder: (context, i) {
                  var categoriadeimoveis = lista[i];
                  return ListTile(
                    leading: iconCircButton(() {}),
                    title: Text(categoriadeimoveis.denominacao),
                    subtitle: Text(
                        categoriadeimoveis.idcategoriadeimoveis.toString() +
                            ' - ' +
                            categoriadeimoveis.denominacao),
                    onTap: () {
                      _back.goToDetails(context, categoriadeimoveis);
                    },
                    trailing: Container(
                      width: 100,
                      child: Row(
                        children: [
                          iconEditButton(() {
                            _back.goToForm(context, categoriadeimoveis);
                          }),
                          iconRemoveButton(context, () {
                            _back.remove(
                                categoriadeimoveis.idcategoriadeimoveis);
                            Navigator.of(context).pop();
                          })
                        ],
                      ),
                    ),
                  );
                },
              );
            }
          },
        );
      }),
    );
  }
}
