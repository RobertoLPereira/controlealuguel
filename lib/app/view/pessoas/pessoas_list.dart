import 'package:controlealuguel/src/models/pessoas/pessoas_wrap.dart';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'pessoas_list_back.dart';

class PessoastList extends StatefulWidget {
  @override
  State<PessoastList> createState() => _PessoastListState();
}

class _PessoastListState extends State<PessoastList> {
  final _back = PessoasListBack();
  var pg = "0";
  var ativo = 1;
  var proprietario;
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

  Widget iconImovelButton(Function onPressed) {
    return IconButton(
        icon: Icon(Icons.home),
        color: Colors.orange,
        tooltip: 'Manter Imóvel',
        onPressed: onPressed);
  }

  Widget iconListarPgButton(Function onPressed) {
    if (int.parse(pg) > 0) {
      return IconButton(
          icon: Icon(Icons.monetization_on),
          color: Colors.green.shade400,
          tooltip: 'Listar Pg',
          onPressed: onPressed);
    } else {
      return IconButton(
          icon: Icon(Icons.list_alt_rounded),
          color: Colors.green.shade400,
          tooltip: 'Sem Pg no mês',
          onPressed: onPressed);
    }
  }

  Widget iconPagtoButton(Function onPressed) {
    if (int.parse(pg) > 0) {
      return IconButton(
          icon: Icon(Icons.check_box),
          tooltip: 'Listar Pg',
          color: Colors.green.shade300,
          onPressed: onPressed);
    } else {
      return IconButton(
          icon: Icon(Icons.money_rounded),
          color: Colors.red.shade500,
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
          title: Text('Lista de Pessoas'),
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
                  List<PessoasWrap> lista = futuro.data;
                  return ListView.builder(
                    itemCount: lista.length,
                    itemBuilder: (context, i) {
                      var contato = lista[i];
                      if (contato.proprietario == null) {
                        proprietario = false;
                      } else {
                        proprietario = true;
                      }
                      if (contato.telefone == null) {
                        contato.telefone = 'Não Informado';
                      }
                      if (contato.pago == null) {
                        pg = 0 as String;
                      } else {
                        pg = contato.pago;
                      }
                      ativo = contato.status;
                      if (contato.idcontrato != null) {
                        return ListTile(
                          leading: circleAvatar(contato.urlAvatar),
                          title: Text(contato.nome),
                          onTap: () {
                            _back.goToDetails(context, contato);
                          },
                          subtitle: Text(contato.telefone),
                          trailing: Container(
                            width: 160,
                            child: Row(
                              children: [
                                iconEditButton(() {
                                  _back.goToForm(context, contato);
                                }),
                                iconPagtoButton(() {
                                  if (int.parse(contato.pago) > 0) {
                                    _back.goToListaPagamentos(context, contato);
                                  } else {
                                    _back.goToFormPagto(context, contato);
                                  }
                                }),
                                iconDelAtivButton(() {
                                  if (contato.status == 1) {
                                    _back.remove(contato.idpessoa, context);
                                  } else {
                                    _back.reativar(contato.idpessoa, context);
                                  }
                                }),
                                iconListarPgButton(() {
                                  _back.goToListaPagamentos(context, contato);
                                }),
                              ],
                            ),
                          ),
                        );
                      } else if (proprietario) {
                        return ListTile(
                          leading: circleAvatar(contato.urlAvatar),
                          title: Text(contato.nome),
                          onTap: () {
                            _back.goToDetails(context, contato);
                          },
                          subtitle: Text(contato.telefone),
                          trailing: Container(
                            width: 120,
                            child: Row(
                              children: [
                                iconEditButton(() {
                                  _back.goToForm(context, contato);
                                }),
                                iconImovelButton(() {
                                  _back.goToImovel(context, contato);
                                })
                              ],
                            ),
                          ),
                        );
                      } else {
                        return ListTile(
                          leading: circleAvatar(contato.urlAvatar),
                          title: Text(contato.nome),
                          onTap: () {
                            _back.goToDetails(context, contato);
                          },
                          subtitle: Text(contato.telefone),
                          trailing: Container(
                            width: 120,
                            child: Row(
                              children: [
                                iconEditButton(() {
                                  _back.goToForm(context, contato);
                                }),
                                iconDelAtivButton(() {
                                  _back.remove(contato.idpessoa, context);
                                })
                              ],
                            ),
                          ),
                        );
                      } //fim else
                    },
                  );
                }
              });
        }));
  }
}
