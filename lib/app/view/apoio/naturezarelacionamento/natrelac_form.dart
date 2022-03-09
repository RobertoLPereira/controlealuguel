import 'package:flutter/material.dart';
import 'natrelac_form_back.dart';

class NatRelacForm extends StatelessWidget {
  final _form = GlobalKey<FormState>();

  Widget fieldName(NatRelacFormBack back) {
    return TextFormField(
        validator: back.validateName,
        onSaved: (newValue) => back.natrelac.denominacao = newValue,
        initialValue: back.natrelac.denominacao,
        decoration: InputDecoration(labelText: 'Denominação:'));
  }

  @override
  Widget build(BuildContext context) {
    var _back = NatRelacFormBack(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Situações'),
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
            children: [fieldName(_back)],
          ),
        ),
      ),
    );
  }
}
