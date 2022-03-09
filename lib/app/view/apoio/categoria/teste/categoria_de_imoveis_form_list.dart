import 'package:flutter/material.dart';
import '../../../cheetah_button.dart';
import '../Categoria_de_imoveis_form_back.dart';
import 'categoria_list.dart';

class CategoriaFormList extends StatelessWidget {
  final _form = GlobalKey<FormState>();

  Widget iconCircButton(Function onPressed) {
    return IconButton(
        icon: Icon(Icons.stairs), color: Colors.orange, onPressed: onPressed);
  }

  Widget iconEditButton(Function onPressed) {
    return IconButton(
        icon: Icon(Icons.edit), color: Colors.orange, onPressed: onPressed);
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
        title: Text('Cadastro de Categorias'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(32),
        child: Form(
          key: _form,
          child: Column(
            children: [
              fieldName(_back),
              SizedBox(height: 20),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                CheetahButton(
                    text: 'Incluir',
                    onPressed: () {
                      _form.currentState.validate();
                      _form.currentState.save();
                      if (_back.isValid) {
                        _back.save(context);
                      }
                    }),
              ]),
              SizedBox(height: 20),
              CategoriaList(),
            ],
          ),
        ),
      ),
    );
  }
}
