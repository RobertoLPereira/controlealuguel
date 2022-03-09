import 'package:flutter/material.dart';
import 'categoria_de_imoveis_back_form.dart';

class CategoriadeimoveisForm extends StatelessWidget {
  final _form = GlobalKey<FormState>();

  Widget fieldDenominacao(CategoriadeimoveisFormBack back) {
    return TextFormField(
        validator: back.validateDenominacao,
        onSaved: (newValue) => back.categoriadeimoveis.denominacao = newValue,
        initialValue: back.categoriadeimoveis.denominacao,
        decoration: InputDecoration(
          labelText: 'denominacao:',
        ));
  }

  @override
  Widget build(BuildContext context) {
    var _back = CategoriadeimoveisFormBack(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Categoriadeimoveis'),
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                _form.currentState.validate();
                _form.currentState.save();
                if (_back.isValid) {
                  _back.save(context);
                }
              })
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Form(
          key: _form,
          child: Column(
            children: [
              fieldDenominacao(_back),
            ],
          ),
        ),
      ),
    );
  }
}
