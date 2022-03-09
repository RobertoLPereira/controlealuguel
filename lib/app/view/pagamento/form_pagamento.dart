import 'package:controlealuguel/src/utils/formdatepicker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import '../../../application.dart';
import 'package:intl/intl.dart' as intl;

import 'form_pagamento_back.dart';

class FormPagamento extends StatefulWidget {
  @override
  State<FormPagamento> createState() => _FormPagamentoState();
}

class _FormPagamentoState extends State<FormPagamento> {
  final _form = GlobalKey<FormState>();

  final _cValor = MoneyMaskedTextController(
    thousandSeparator: '.',
    decimalSeparator: ',',
    leftSymbol: 'R\$ ',
  );

  Widget fieldName(FormPagamentoBack back) {
    return TextFormField(
        onSaved: (newValue) => back.pessoa.nome = newValue,
        initialValue: back.pessoa.nome,
        decoration: InputDecoration(labelText: 'Nome:'));
  }

  Widget fieldPhone(FormPagamentoBack back) {
    var mask = MaskTextInputFormatter(mask: '(##) # ####-####');
    return TextFormField(
        onSaved: (newValue) => back.pessoa.telefone = newValue,
        initialValue: back.pessoa.telefone,
        inputFormatters: [mask],
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            labelText: 'Telefone:', hintText: '(99) 9 9999-9999'));
  }

  Widget fieldValorRecebido(FormPagamentoBack back) {
    //var mask = MaskTextInputFormatter(mask: '###,##');
    return TextFormField(
        validator: back.validateValorPagar,
        onSaved: (newValue) => back.pessoa.valor = double.parse(newValue),
        initialValue: back.pessoa.valor.toString(),
        //inputFormatters: [mask],
        keyboardType: TextInputType.numberWithOptions(decimal: true),
        decoration:
            InputDecoration(labelText: 'Valor a receber:', hintText: '000.00'));
  }

  @override
  Widget build(BuildContext context) {
    double maxValue = 0;
    DateTime date = DateTime.now();
    final inputValor = TextFormField(
      controller: _cValor,
      autofocus: false,
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        hintText: 'Valor R\$',
        contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      validator: (value) {
        if (currencyToDouble(value) < 0.0) {
          return 'Obrigatório';
        }
        return null;
      },
    );
    var _back = FormPagamentoBack(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Incluir Recebimento do Aluguel'),
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                _form.currentState.save();
                _back.save(context);
                //_form.currentState.validate();
                //_form.currentState.save();
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
              fieldValorRecebido(_back),
              inputValor,
              Text(
                intl.NumberFormat.currency(symbol: "\$", decimalDigits: 0)
                    .format(maxValue),
                style: Theme.of(context).textTheme.subtitle1,
              ),
              fieldName(_back),
              fieldPhone(_back),
              FormDatePicker(
                date: date,
                onChanged: (value) {
                  setState(() {
                    date = value;
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
