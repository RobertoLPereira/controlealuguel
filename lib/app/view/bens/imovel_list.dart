import 'package:controlealuguel/src/models/bens/imovelWrap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'imovel_list_back.dart';

class ImovelList extends StatefulWidget {
  @override
  State<ImovelList> createState() => _ImovelListState();
}

class _ImovelListState extends State<ImovelList> {
  final _back = ImovelListBack();
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
          title: Text('Lista de Imoveis'),
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
                  List<ImovelWrap> lista = futuro.data;
                  return ListView.builder(
                    itemCount: lista.length,
                    itemBuilder: (context, i) {
                      var imovel = lista[i];
                      //print(imovel);
                      if (imovel.telefone == null) {
                        imovel.telefone = 'Não Informado';
                      }

                      ativo = imovel.status;
                      if (imovel.idpessoa != null) {
                        return ListTile(
                          leading: circleAvatar(
                              'https://cdn-icons-png.flaticon.com/512/2329/2329140.png'),
                          title: Text(imovel.descricao),
                          onTap: () {
                            _back.goToDetails(context, imovel);
                          },
                          subtitle: Text(imovel.endereco),
                          trailing: Container(
                            width: 120,
                            child: Row(
                              children: [
                                iconEditButton(() {
                                  _back.goToForm(context, imovel);
                                }),
                                /*iconPagtoButton(() {
                                  if (int.parse(imovel.pago) > 0) {
                                    _back.goToListaUnidades(context, imovel);
                                  } else {
                                    _back.goToFormUnidade(context, imovel);
                                  }
                                }),*/
                                iconDelAtivButton(() {
                                  if (imovel.status == 1) {
                                    _back.remove(imovel.idpessoa, context);
                                  } else {
                                    _back.reativar(imovel.idpessoa, context);
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
                          title: Text(imovel.descricao),
                          onTap: () {
                            _back.goToDetails(context, imovel);
                          },
                          subtitle: Text(imovel.endereco),
                          trailing: Container(
                            width: 120,
                            child: Row(
                              children: [
                                iconEditButton(() {
                                  _back.goToForm(context, imovel);
                                }),
                                iconDelAtivButton(() {
                                  _back.remove(imovel.idpessoa, context);
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
