import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'pessoa_form_back.dart';

class PessoasForm extends StatelessWidget {
  final _form = GlobalKey<FormState>();

  Widget fieldName(PessoasWrapFormBack back) {
    return TextFormField(
        validator: back.validateName,
        onSaved: (newValue) => back.pessoasWrap.nome = newValue,
        initialValue: back.pessoasWrap.nome,
        decoration: InputDecoration(labelText: 'Nome:'));
  }

  Widget fieldEmail(PessoasWrapFormBack back) {
    return TextFormField(
        validator: back.validateEmail,
        onSaved: (newValue) => back.pessoasWrap.email = newValue,
        initialValue: back.pessoasWrap.email,
        decoration: InputDecoration(labelText: 'E-mail:'));
  }

  Widget fieldPhone(PessoasWrapFormBack back) {
    var mask = MaskTextInputFormatter(mask: '(##) # ####-####');
    return TextFormField(
        validator: back.validatePhone,
        onSaved: (newValue) => back.pessoasWrap.telefone = newValue,
        initialValue: back.pessoasWrap.telefone,
        inputFormatters: [mask],
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            labelText: 'Telefone:', hintText: '(99) 9 9999-9999'));
  }

  Widget fieldURLImage(PessoasWrapFormBack back) {
    return TextFormField(
        onSaved: (newValue) => back.pessoasWrap.urlAvatar = newValue,
        initialValue: back.pessoasWrap.urlAvatar,
        decoration: InputDecoration(
            labelText: 'Endereço Foto:', hintText: 'http://www.site.com'));
  }

  @override
  Widget build(BuildContext context) {
    var _back = PessoasWrapFormBack(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Pessoas'),
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
              fieldName(_back),
              fieldEmail(_back),
              fieldPhone(_back),
              fieldURLImage(_back)
            ],
          ),
        ),
      ),
    );
  }
}
