import 'package:controlealuguel/src/models/pessoas/pessoas_wrap.dart';

import 'package:flutter/material.dart';

import 'pessoas_details_back.dart';

class PessoasDetails extends StatelessWidget {
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
    var _back = PessoasDetailsBack(context);
    PessoasWrap pessoasWrap = _back.pessoasWrap;

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        var width = constraints.biggest.width;
        var radius = width / 3;
        // var height = constraints.biggest.height;

        return Scaffold(
          body: ListView(
            padding: EdgeInsets.all(60),
            children: [
              (Uri.tryParse(pessoasWrap.urlAvatar).isAbsolute)
                  ? CircleAvatar(
                      backgroundImage: NetworkImage(pessoasWrap.urlAvatar),
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
                  '${pessoasWrap.nome}',
                  style: TextStyle(fontSize: 30),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text('Telefone:'),
                  subtitle: Text('${pessoasWrap.telefone}'),
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
/*              Card(
                child: ListTile(
                  title: Text('E-mail:'),
                  onTap: () {
                    _back.launchEmail(showModalError);
                  },
                  subtitle: Text('${pessoasWrap.email}'),
                ),
              ),*/
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
