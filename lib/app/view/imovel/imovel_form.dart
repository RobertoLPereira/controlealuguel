import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

import 'imovel_form_back.dart';

class ImovelForm1 extends StatefulWidget {
  @override
  State<ImovelForm1> createState() => _ImovelFormState();
}

class _ImovelFormState extends State<ImovelForm1> {
  final _form = GlobalKey<FormState>();

  Widget fieldIdimovel(ImovelFormBack back) {
    return TextFormField(
        //validator: back.validateIdimovel(back.imovel.idimovel),
        onSaved: (newValue) => back.imovel.idimovel = newValue,
        initialValue: back.imovel.idimovel,
        decoration: InputDecoration(
          labelText: 'idimovel:',
        ));
  }

  Widget fieldDescricao(ImovelFormBack back) {
    return TextFormField(
        validator: back.validateDescricao,
        onSaved: (newValue) => back.imovel.descricao = newValue,
        initialValue: back.imovel.descricao,
        decoration: InputDecoration(
          labelText: 'descricao:',
        ));
  }

  Widget fieldEndereco(ImovelFormBack back) {
    return TextFormField(
        validator: back.validateEndereco,
        onSaved: (newValue) => back.imovel.endereco = newValue,
        initialValue: back.imovel.endereco,
        decoration: InputDecoration(
          labelText: 'endereco:',
        ));
  }

  Widget fieldIdproprietario(ImovelFormBack back) {
    return TextFormField(
        //validator: back.validateIdproprietario,
        onSaved: (newValue) => back.imovel.idproprietario = newValue,
        initialValue: back.imovel.idproprietario,
        decoration: InputDecoration(
          labelText: 'idproprietario:',
        ));
  }

  Widget fieldStatus(ImovelFormBack back) {
    return TextFormField(
        //validator: back.validateStatus,
        onSaved: (newValue) => back.imovel.status = newValue,
        initialValue: back.imovel.status,
        decoration: InputDecoration(
          labelText: 'status:',
        ));
  }

  Widget fieldIdimovelcategoria(ImovelFormBack back) {
    return TextFormField(
        //validator: back.validateIdimovelcategoria,
        onSaved: (newValue) => back.imovel.idimovelcategoria = newValue,
        initialValue: back.imovel.idimovelcategoria,
        decoration: InputDecoration(
          labelText: 'idimovelcategoria:',
        ));
  }

  List<dynamic> prop = [];
  int idpessoa;
  @override
  void initState() {
    super.initState();
    this.prop.add({"idpessoa": 1, "nome": "Douglas Amorim Pereira"});
    this.prop.add({"idpessoa": 2, "nome": "Guilherme"});
    this.prop.add({"idpessoa": 3, "nome": "Robson"});
    this.prop.add({"idpessoa": 4, "nome": "Iasmim"});
    this.prop.add({"idpessoa": 5, "nome": "Fernanda"});
    this.prop.add({"idpessoa": 6, "nome": "Carine"});
    this.prop.add({"idpessoa": 7, "nome": "Laura"});
    this.prop.add({"idpessoa": 8, "nome": "Jorge"});
    this.prop.add({"idpessoa": 9, "nome": "Thiago Amorim Pereira"});
    this.prop.add({"idpessoa": 10, "nome": "julio Marques"});
  }

  @override
  Widget build(BuildContext context) {
    var _back = ImovelFormBack(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Imove'),
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
              fieldIdimovel(_back),
              fieldDescricao(_back),
              fieldEndereco(_back),
              fieldIdproprietario(_back),
              fieldStatus(_back),
              fieldIdimovelcategoria(_back),
              FormHelper.dropDownWidget(context, "Selecione proprietário",
                  this.idpessoa.toString(), this.prop, (onChangedVal) {
                this.idpessoa = onChangedVal;
              }, (onValidateVal) {
                if (onValidateVal == null) {
                  return 'Selecione um proprietário';
                }
                return " ";
              }),
            ],
          ),
        ),
      ),
    );
  }
}
