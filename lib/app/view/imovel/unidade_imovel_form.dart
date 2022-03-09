import 'package:controlealuguel/app/view/imovel/unidade_imovel_form_back.dart';
import 'unidade_imovel_form_back.dart';
import 'package:flutter/material.dart';

class UnidadeImovelForm extends StatelessWidget {
  final _form = GlobalKey<FormState>();
  //Definição das propriedades dos campos do formulário
  Widget fieldIdunidade(UnidadeImovelFormBack back) {
    return TextFormField(
        onSaved: (newValue) => back.unid.idunidade,
        initialValue: back.unid.idunidade.toString(),
        decoration: InputDecoration(
          labelText: 'Unidade:',
        ));
  }

  Widget fieldDescricao(UnidadeImovelFormBack back) {
    return TextFormField(
        validator: back.validateDescricao,
        onSaved: (newValue) => back.unid.descricao = newValue,
        initialValue: back.unid.descricao,
        decoration: InputDecoration(
          labelText: 'Descrição:',
        ));
  }

  Widget fieldCategoria(UnidadeImovelFormBack back) {
    return TextFormField(
        validator: back.validateCategoria,
        onSaved: (newValue) => back.unid.idimovelcategoria = newValue,
        onChanged: (value) => back.unid.idimovelcategoria = value,
        initialValue: back.unid.idimovelcategoria,
        decoration: InputDecoration(
          labelText: 'Categoria:',
        ));
  }

  Widget fieldImovel(UnidadeImovelFormBack back) {
    return TextFormField(
        validator: back.validateImovel,
        onSaved: (newValue) => back.unid.idimovel = newValue,
        onChanged: (value) => back.unid.idimovel = value,
        initialValue: back.unid.idimovel,
        decoration: InputDecoration(
          labelText: 'Imovel:',
        ));
  }

  @override
  Widget build(BuildContext context) {
    //Apresentação da tela
    var _back = UnidadeImovelFormBack(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Unidades do Imóvel'),
        actions: [
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.save),
                tooltip: 'Salvar',
                onPressed: () {
                  _form.currentState.validate();
                  _form.currentState.save();
                  if (_back.isValid) {
                    _back.save(context);
                  }
                },
              ),
              IconButton(
                  icon: Icon(Icons.save_rounded),
                  tooltip: 'Várias',
                  color: Colors.amber,
                  onPressed: () {
                    _form.currentState.validate();
                    _form.currentState.save();
                    if (_back.isValid) {
                      _back.saveLoop(context);
                    }
                  }),
            ],
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Form(
          key: _form,
          child: Column(
            children: [
              fieldIdunidade(_back),
              fieldDescricao(_back),
              fieldImovel(_back),
              fieldCategoria(_back),
            ],
          ),
        ),
      ),
    );
  }
}
