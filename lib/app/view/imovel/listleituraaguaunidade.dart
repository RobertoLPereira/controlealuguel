import 'package:controlealuguel/src/models/bens/leituraaguaunidade.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'leituraaguaunidade_list_back.dart';

class ListLeituraaguaunidade extends StatelessWidget {
  final _back = LeituraaguaunidadeListBack();

  CircleAvatar circleAvatar(String url) {
    return (Uri.tryParse(url).isAbsolute)
        ? CircleAvatar(backgroundImage: NetworkImage(url))
        : CircleAvatar(child: Icon(Icons.person));
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
          title: Text('Lista de Leitura de Água da Unidade'),
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
                  List<LeituraAguaUnidade> lista = futuro.data;
                  return ListView.builder(
                    itemCount: lista.length,
                    itemBuilder: (context, i) {
                      var leituraaguaunidade = lista[i];
                      return ListTile(
                        leading: circleAvatar(
                            'https://cdn.pixabay.com/photo/2013/07/13/10/07/man-156584__340.png'),
                        title: Text('$leituraaguaunidade.idunidadeimovel'),
                        onTap: () {
                          _back.goToDetails(context, leituraaguaunidade);
                        },
                        subtitle: Text('$leituraaguaunidade.leituraanterior'),
                        trailing: Container(
                          width: 100,
                          child: Row(
                            children: [
                              iconEditButton(() {
                                _back.goToForm(context, leituraaguaunidade);
                              }),
                              iconRemoveButton(context, () {
                                _back.remove(int.parse(
                                    leituraaguaunidade.idleituraaguaunidade));
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
