import 'package:controlealuguel/src/models/modelonegocio/leitura_de_consumo.dart';

import '../../models/bens/leituraaguaunidade.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'leituradeconsumo_list_back.dart';

class ListLeituraDeConsumo extends StatelessWidget {
  final _back = LeituraDeConsumoListBack();

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
          title: Text('Lista de leitura de consumo'),
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
                        leading: iconCircButton(() {}),
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
                                LeituraDeConsumo consumo = LeituraDeConsumo();
                                consumo.codigomedidoragua =
                                    leituraaguaunidade.codigomedidor as int;
                                consumo.dataleituraagua =
                                    leituraaguaunidade.dataleitura;
                                consumo.idunidadeimovel =
                                    leituraaguaunidade.idunidadeimovel as int;
                                consumo.leituraanterior = leituraaguaunidade
                                    .leituraanterior as double;
                                consumo.leituraatual =
                                    leituraaguaunidade.leituraatual as double;
                                consumo.status =
                                    leituraaguaunidade.status as int;
                                consumo.valor =
                                    leituraaguaunidade.valor as double;
                                _back.goToForm(context, consumo);
                              }),
                              iconRemoveButton(context, () {
                                _back.remove(leituraaguaunidade
                                    .idleituraaguaunidade as int);
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
