import '../../../domain/entities/status.dart';
import 'package:flutter/material.dart';

import 'status_details_back.dart';

class StatusDetails extends StatelessWidget {
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
    var _back = StatusDetailsBack(context);
    Status status = _back.status;

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Scaffold(
          body: ListView(
            padding: EdgeInsets.all(60),
            children: [
              Center(
                child: Text(
                  '${status.denominacao}',
                  style: TextStyle(fontSize: 30),
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
