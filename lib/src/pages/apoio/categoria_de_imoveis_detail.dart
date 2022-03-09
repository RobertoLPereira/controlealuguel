/*
import '../../models/apoio/categoria_de_imoveis.dart';
import 'categoria_de_imoveis_back_detail.dart';
import 'package:flutter/material.dart';

class CategoriadeimoveisDetails extends StatelessWidget {
  showModalError(BuildContext context) {
    var alert = AlertDialog(
      title: Text('Alerta!'),
      content: Text('Não foi possível encontrar um APP compatível.'),
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }

  @override
  Widget build(BuildContext context) {
    var _back = CategoriadeimoveisDetailsBack(context);
    Categoriadeimoveis categoriadeimoveis = _back.categoriadeimoveis;

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        var width = constraints.biggest.width;
        var radius = width / 3;
        // var height = constraints.biggest.height;

        return Scaffold(
          body: ListView(
            padding: EdgeInsets.all(60),
            children: [
              (Uri.tryParse(categoriadeimoveis.urlAvatar).isAbsolute)
                  ? CircleAvatar(
                      backgroundImage:
                          NetworkImage(categoriadeimoveis.urlAvatar),
                      radius: radius,
                    )
                  : CircleAvatar(
                      child: Icon(
                        Icons.person,
                        size: width / 2,
                      ),
                      radius: radius,
                    ),
              Center(
                child: Text(
                  '${categoriadeimoveis.nome}',
                  style: TextStyle(fontSize: 30),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text('Telefone:'),
                  subtitle: Text('${categoriadeimoveis.telefone}'),
                  trailing: Container(
                    width: width / 4,
                    child: Row(children: [
                      IconButton(
                          color: Colors.blue,
                          icon: Icon(Icons.message),
                          onPressed: () {
                            _back.launchSMS(showModalError);
                          }),
                      IconButton(
                          color: Colors.blue,
                          icon: Icon(Icons.phone),
                          onPressed: () {
                            _back.launchPhone(showModalError);
                          })
                    ]),
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text('E-mail:'),
                  onTap: () {
                    _back.launchEmail(showModalError);
                  },
                  subtitle: Text('${categoriadeimoveis.email}'),
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.arrow_back),
            onPressed: () {
              _back.goToBack();
            },
          ),
        );
      },
    );
  }
}
*/