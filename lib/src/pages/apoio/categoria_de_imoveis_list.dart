import 'package:controlealuguel/src/models/apoio/categorias.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../app/view/apoio/categoria/categoria_de_imoveis_back.dart';

class ListCategoriadeimoveis extends StatelessWidget {
  final _back = CategoriadeimoveisListBack();

  CircleAvatar circleAvatar(String url) {
    url = url.replaceAll(' ', '');
    return (Uri.tryParse(url).isAbsolute)
        ? CircleAvatar(backgroundImage: NetworkImage(url))
        : CircleAvatar(child: Icon(Icons.person));
  }

  Widget iconEditButton(Function onPressed) {
    return IconButton(
        icon: Icon(Icons.edit), color: Colors.orange, onPressed: onPressed());
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
          title: Text('Lista de categoriadeimoveis'),
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
                        leading: circleAvatar(
                            'https://cdn.pixabay.com/photo/2013/07/13/10/07/man-156584__340.png'),
                        title: Text('$categoriadeimoveis.denominacao'),
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
              });
        }));
  }
}
