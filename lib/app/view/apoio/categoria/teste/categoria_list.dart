import 'package:controlealuguel/src/models/apoio/categorias.dart';
import 'package:flutter/material.dart';

import '../categoria_de_imoveis_back.dart';

class CategoriaList extends StatelessWidget {
  final _back = CategoriadeimoveisListBack();
  //final List<User> users;
  // final Function(User) onDelete;
  //final Function(User) onEdit;

  //UserList(this.users, this.onDelete, this.onEdit);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _back.list,
        builder: (context, futuro) {
          if (!futuro.hasData) {
            return CircularProgressIndicator();
          } else {
            List<Categorias> lista = futuro.data as List<Categorias>;

            return ListView.builder(
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) => Card(
                elevation: 8,
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Nº: ${lista[index].idcategoriadeimoveis}',
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            'Denominação: ${lista[index].denominacao}',
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                      IconButton(
                          icon: Icon(Icons.edit, color: Colors.orange),
                          onPressed: () =>
                              _back.goToForm(context, lista[index])),
                      IconButton(
                          icon: Icon(Icons.delete, color: Colors.redAccent),
                          onPressed: () => _back
                              .remove(lista[index].idcategoriadeimoveis)
                              .Navigator
                              .of(context)
                              .pop()),
                    ],
                  ),
                ),
              ),
              itemCount: lista.length,
            );
          }
        });
  }
}
