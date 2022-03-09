import 'package:controlealuguel/src/models/apoio/faixadeconsumo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'faixa_de_consumo_lista_back.dart';

class ListFaixadeconsumo extends StatelessWidget {
  final _back = FaixaConsumoListBack();

  CircleAvatar circleAvatar(String url) {
    return (Uri.tryParse(url).isAbsolute)
        ? CircleAvatar(backgroundImage: NetworkImage(url))
        : CircleAvatar(child: Icon(Icons.person));
  }

  Widget iconCircButton(Function onPressed) {
    return IconButton(
        icon: Icon(Icons.stairs), color: Colors.green, onPressed: onPressed);
  }

  Widget iconEditButton(Function onPressed) {
    return IconButton(
        icon: Icon(Icons.edit),
        color: Colors.orange,
        tooltip: 'Editar',
        onPressed: onPressed);
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
                      ElevatedButton(
                        child: Text('Não'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      ElevatedButton(
                        child: Text('Sim'),
                        onPressed: remove,
                      ),
                    ],
                  ));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Lista de faixadeconsumo'),
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
                  List<Faixadeconsumo> lista = futuro.data;
                  return ListView.builder(
                    itemCount: lista.length,
                    itemBuilder: (context, i) {
                      var faixadeconsumo = lista[i];
                      return ListTile(
                        leading: iconCircButton(() {}),
                        title: Text(faixadeconsumo.denominacao),
                        onTap: () {
                          _back.goToDetails(context, faixadeconsumo);
                        },
                        subtitle: Text('De ' +
                            faixadeconsumo.faixainicial.toString() +
                            ' a ' +
                            faixadeconsumo.faixafinal.toString()),
                        trailing: Container(
                          width: 100,
                          child: Row(
                            children: [
                              iconEditButton(() {
                                _back.goToForm(context, faixadeconsumo);
                              }),
                              iconRemoveButton(context, () {
                                _back.remove(
                                    int.parse(faixadeconsumo.idfaixadeconsumo));
                                Navigator.of(context).pop();
                              })
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              });
        }));
  }
}
