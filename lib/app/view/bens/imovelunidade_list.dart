import '../../domain/entities/unidade_imovel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'imovelunidade_list_back.dart';

class ImovelUnidadeList extends StatefulWidget {
  @override
  State<ImovelUnidadeList> createState() => _ImovelUnidadeListState();
}

class _ImovelUnidadeListState extends State<ImovelUnidadeList> {
  final _back = ImovelUnidadeListBack();
  var pg = "0";
  var ativo = 1;
  CircleAvatar circleAvatar(String url) {
    //print('url = $url');
    if (url == null) {
      url =
          'https://cdn.pixabay.com/photo/2013/07/13/10/07/man-156584_960_720.png';
    } else {
      url = url.replaceAll(" ", "");
    }
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

  Widget iconAlugarButton(Function onPressed) {
    return IconButton(
        icon: Icon(Icons.keyboard),
        color: Colors.orange,
        tooltip: 'Alugar',
        onPressed: onPressed);
  }

  Widget iconManterConsumoButton(Function onPressed) {
    return IconButton(
        icon: Icon(Icons.money),
        color: Colors.orange,
        tooltip: 'Registrar consumo',
        onPressed: onPressed);
  }

  Widget iconPagtoButton(Function onPressed) {
    if (int.parse(pg) > 0) {
      return IconButton(
          icon: Icon(Icons.check_box),
          tooltip: 'Pago $pg',
          color: Colors.green,
          onPressed: onPressed);
    } else {
      return IconButton(
          icon: Icon(Icons.money_sharp),
          color: Colors.deepOrangeAccent,
          tooltip: 'Pagar',
          onPressed: onPressed);
    }
  }

  Widget iconDelAtivButton(Function onPressed) {
    if (ativo == 2) {
      return IconButton(
          icon: Icon(Icons.update),
          tooltip: 'Reativar',
          color: Colors.green,
          onPressed: onPressed);
    } else {
      return IconButton(
          icon: Icon(Icons.delete),
          color: Colors.red,
          tooltip: 'Desativar',
          onPressed: onPressed);
    }
  }

  Widget iconRemoveButton(BuildContext context, Function remove) {
    if (ativo == 2) {
      return IconButton(
          icon: Icon(Icons.update),
          color: Colors.green,
          tooltip: 'Reativar',
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      title: Text('Reativar'),
                      content: Text('Confirma a Reativação?'),
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
    } else {
      return IconButton(
          icon: Icon(Icons.delete),
          color: Colors.red,
          tooltip: 'Desativar',
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Lista de Unidades do Imovel'),
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
                  List<UnidadeImovel> lista = futuro.data;
                  return ListView.builder(
                    itemCount: lista.length,
                    itemBuilder: (context, i) {
                      var imovelunid = lista[i];
                      //print(imovelunid);
                      ativo = int.parse(imovelunid.status);
                      // print(imovelunid.nome + ' = ' + imovelunid.idlocatario);
                      if (int.parse(imovelunid.idlocatario) == 0) {
                        return ListTile(
                          leading: circleAvatar(
                              'https://cdn-icons-png.flaticon.com/512/2329/2329140.png'),
                          title: Text(
                              imovelunid.descricao + ',' + imovelunid.endereco),
                          onTap: () {
                            _back.goToDetails(context, imovelunid);
                          },
                          subtitle: Text('Locatário : ' + imovelunid.nome),
                          trailing: Container(
                            width: 120,
                            child: Row(
                              children: [
                                iconEditButton(() {
                                  _back.goToForm(context, imovelunid);
                                }),
                                iconAlugarButton(() {
                                  if (imovelunid.nome == 'Não Alugado') {
                                    _back.goToAlugarUnidades(
                                        context, imovelunid);
                                  } else {
                                    _back.goToListaUnidades(
                                        context, imovelunid);
                                  }
                                }),
                                iconDelAtivButton(() {
                                  if (imovelunid.status == 1) {
                                    _back.remove(imovelunid.idunidade, context);
                                  } else {
                                    _back.reativar(
                                        imovelunid.idunidade, context);
                                  }
                                })
                              ],
                            ),
                          ),
                        );
                      } else {
                        return ListTile(
                          leading: circleAvatar(
                              'https://cdn-icons-png.flaticon.com/512/2329/2329140.png'),
                          title: Text(
                              imovelunid.descricao + ',' + imovelunid.endereco),
                          onTap: () {
                            _back.goToDetails(context, imovelunid);
                          },
                          subtitle: Text('Locatário : ' + imovelunid.nome),
                          trailing: Container(
                            width: 120,
                            child: Row(
                              children: [
                                iconEditButton(() {
                                  _back.goToForm(context, imovelunid);
                                }),
                                iconDelAtivButton(() {
                                  _back.remove(imovelunid.idunidade, context);
                                }),
                                iconManterConsumoButton(() {
                                  _back.goToManterConsumo(context, imovelunid);
                                })
                              ],
                            ),
                          ),
                        );
                      }
                    },
                  );
                }
              });
        }));
  }
}
