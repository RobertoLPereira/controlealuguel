import 'alugar_unidade_imovel_form_back.dart';
import 'package:flutter/material.dart';

class AlugarUnidadeImovelForm extends StatelessWidget {
  final _form = GlobalKey<FormState>();
  //Definição das propriedades dos campos do formulário
  Widget fieldIdunidade(AlugarUnidadeImovelFormBack back) {
    return TextFormField(
        enabled: false,
        onSaved: (newValue) => back.unid.idunidade,
        initialValue: back.unid.idunidade.toString(),
        decoration: InputDecoration(
          labelText: 'Unidade:',
        ));
  }

  Widget fieldDescricao(AlugarUnidadeImovelFormBack back) {
    return TextFormField(
        enabled: false,
        onSaved: (newValue) => back.unid.descricao = newValue,
        initialValue: back.unid.descricao,
        decoration: InputDecoration(
          labelText: 'Descrição:',
        ));
  }

  Widget fieldCategoria(AlugarUnidadeImovelFormBack back) {
    return TextFormField(
        enabled: false,
        onSaved: (newValue) => back.unid.idimovelcategoria = newValue,
        initialValue: back.unid.idimovelcategoria.toString(),
        decoration: InputDecoration(
          labelText: 'Categoria:',
        ));
  }

  Widget fieldImovel(AlugarUnidadeImovelFormBack back) {
    return TextFormField(
        enabled: false,
        onSaved: (newValue) => back.unid.idimovel = newValue,
        initialValue: back.unid.idimovel.toString(),
        decoration: InputDecoration(
          labelText: 'Imovel:',
        ));
  }

  Widget fieldLocatario(AlugarUnidadeImovelFormBack back) {
    return TextFormField(
        validator: back.validadeLocatario,
        initialValue: back.unid.idlocatario.toString(),
        onSaved: (newValue) => back.unid.idlocatario = newValue,
        decoration: InputDecoration(
          labelText: 'Locatário:',
        ));
  }

  @override
  Widget build(BuildContext context) {
    //Apresentação da tela
    var _back = AlugarUnidadeImovelFormBack(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alugar Unidades do Imóvel'),
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
              fieldLocatario(_back),
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
