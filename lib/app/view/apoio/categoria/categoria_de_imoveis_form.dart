import 'package:flutter/material.dart';
import 'Categoria_de_imoveis_form_back.dart';

class CategoriaForm extends StatelessWidget {
  final _form = GlobalKey<FormState>();

  Widget fieldName(CategoriaFormBack back) {
    return TextFormField(
        validator: back.validateName,
        onSaved: (newValue) => back.categorias.denominacao = newValue,
        initialValue: back.categorias.denominacao,
        decoration: InputDecoration(labelText: 'Denominação:'));
  }

  @override
  Widget build(BuildContext context) {
    var _back = CategoriaFormBack(context);
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
