import 'package:controlealuguel/src/models/apoio/naturezarelacionamentos.dart';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'natrelac_list_back.dart';

class NatRelacList extends StatelessWidget {
  final _back = NatRelacListBack();

  Widget iconEditButton(Function onPressed) {
    return IconButton(
        icon: Icon(Icons.edit), color: Colors.orange, onPressed: onPressed);
  }

  Widget iconCircButton(Function onPressed) {
    return IconButton(
        icon: Icon(Icons.local_activity),
        color: Colors.orange,
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
          title: Text('Lista de situações'),
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
                  List<Naturezarelacionamento> lista = futuro.data;
                  return ListView.builder(
                    itemCount: lista.length,
                    itemBuilder: (context, i) {
                      var natrelac = lista[i];
                      return ListTile(
                        leading: iconCircButton(() {}),
                        title: Text(natrelac.denominacao),
                        onTap: () {
                          _back.goToDetails(context, natrelac);
                        },
                        subtitle: Text(natrelac.id.toString() +
                            ' - ' +
                            natrelac.denominacao),
                        trailing: Container(
                          width: 120,
                          child: Row(
                            children: [
                              iconEditButton(() {
                                _back.goToForm(context, natrelac);
                              }),
                              iconRemoveButton(context, () {
                                _back.remove(natrelac.id, context);
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
