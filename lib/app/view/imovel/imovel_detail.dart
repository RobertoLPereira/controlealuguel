import 'package:controlealuguel/src/models/bens/imovelWrap.dart';
import 'package:flutter/material.dart';

import 'imovel_detail_back.dart';

class ImovelDetails extends StatelessWidget {
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
    var _back = ImovelDetailsBack(context);
    ImovelWrap imovel = _back.imovel;

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        var width = constraints.biggest.width;
        var radius = width / 3;
        // var height = constraints.biggest.height;

        return Scaffold(
          body: ListView(
            padding: EdgeInsets.all(20),
            children: [
              (Uri.tryParse(
                          'https://cdn-icons-png.flaticon.com/512/2329/2329140.png')
                      .isAbsolute)
                  ? CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://cdn-icons-png.flaticon.com/512/2329/2329140.png'),
                      radius: radius,
                    )
                  : CircleAvatar(
                      child: Icon(
                        Icons.home,
                        size: width / 2,
                      ),
                      radius: radius,
                    ),
              Center(
                child: Text(
                  imovel.descricao,
                  style: TextStyle(fontSize: 30),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text('Endereço:'),
                  subtitle: Text(imovel.endereco),
                  trailing: Container(
                    width: width / 4,
                    child: Row(children: [
                      IconButton(
                          color: Colors.blue,
                          icon: Icon(Icons.message),
                          onPressed: () {
                            //_back.imovel.endereco.(showModalError);
                          }),
                      IconButton(
                          color: Colors.blue,
                          icon: Icon(Icons.phone),
                          onPressed: () {
                            // _back.launchPhone(showModalError);
                          })
                    ]),
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text('Categoria:'),
                  onTap: () {
                    _back.imovel.idimovelcategoria;
                  },
                  subtitle: Text(_back.imovel.idimovelcategoria.toString()),
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
