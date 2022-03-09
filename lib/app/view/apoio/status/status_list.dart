import '../../../domain/entities/status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'status_list_back.dart';

class StatusList extends StatelessWidget {
  final _back = StatusListBack();

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
                  List<Status> lista = futuro.data;
                  return ListView.builder(
                    itemCount: lista.length,
                    itemBuilder: (context, i) {
                      var situacao = lista[i];
                      return ListTile(
                        leading: iconCircButton(() {}),
                        title: Text(situacao.denominacao),
                        onTap: () {
                          _back.goToDetails(context, situacao);
                        },
                        subtitle: Text(situacao.idstatus.toString() +
                            ' - ' +
                            situacao.denominacao),
                        trailing: Container(
                          width: 120,
                          child: Row(
                            children: [
                              iconEditButton(() {
                                _back.goToForm(context, situacao);
                              }),
                              iconRemoveButton(context, () {
                                _back.remove(situacao.idstatus, context);
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
