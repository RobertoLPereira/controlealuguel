import 'dart:convert';
import 'package:controlealuguel/nomedosservidores.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../formdatepicker.dart';
import 'form_leituraaguaunidade_controller.dart';

class FormLeituraUnidadeAgua extends StatefulWidget {
  @override
  State<FormLeituraUnidadeAgua> createState() => _FormLeituraUnidadeAguaState();
}

class _FormLeituraUnidadeAguaState extends State<FormLeituraUnidadeAgua> {
  final _form = GlobalKey<FormState>();
  bool isLoading = false;
  bool isStatusLoading = false;
  bool isUnidadeLoading = false;

  List<dynamic> _status = [];
  List<dynamic> _unidade = [];

  Widget fieldStatus(LeituraaguaunidadeFormController back) {
    // print('Situação');
    if (isStatusLoading) {
      //print(_status);
      return DropdownButtonHideUnderline(
        child: ButtonTheme(
          alignedDropdown: true,
          child: DropdownButton<String>(
            value: back.leituraaguaunidade.status,
            iconSize: 30,
            icon: (null),
            borderRadius: BorderRadius.horizontal(),
            style: TextStyle(
              color: Colors.black54,
              fontSize: 16,
            ),
            hint: Text('Selecione a situação'),
            onChanged: (String newValue) {
              setState(() {
                back.leituraaguaunidade.status = (newValue);
              });
            },
            items: _status?.map((status) {
                  // print(status);
                  return new DropdownMenuItem(
                    child: new Text(status['denominacao']),
                    value: status['idstatus'].toString(),
                  );
                })?.toList() ??
                [],
          ),
        ),
      );
    } else {
      return TextFormField(
          onSaved: (newValue) => back.leituraaguaunidade.status = (newValue),
          initialValue: "1",
          decoration: InputDecoration(
            labelText: 'Situação:',
          ));
    }
  }

  //definicao dos campos do formulario
  Widget fieldIdunidadeimovel(LeituraaguaunidadeFormController back) {
    return DropdownButtonHideUnderline(
      child: ButtonTheme(
        alignedDropdown: true,
        child: DropdownButton<String>(
          value: back.leituraaguaunidade.idunidadeimovel.toString(),
          iconSize: 30,
          icon: (null),
          borderRadius: BorderRadius.horizontal(),
          style: TextStyle(
            color: Colors.black54,
            fontSize: 16,
          ),
          hint: Text('Selecione a unidade'),
          onChanged: (String newValue) {
            setState(() {
              back.leituraaguaunidade.idunidadeimovel = (newValue);
            });
          },
          items: _unidade?.map((item) {
                return new DropdownMenuItem(
                  child: new Text(item['descricao']),
                  value: item['idunidade'].toString(),
                );
              })?.toList() ??
              [],
        ),
      ),
    );
  }

  Widget fieldLeituraanterior(LeituraaguaunidadeFormController back) {
    return TextFormField(
        validator: back.validateLeituraanterior,
        onSaved: (newValue) =>
            back.leituraaguaunidade.leituraanterior = (newValue),
        onChanged: (value) => back.leituraaguaunidade.leituraanterior = (value),
        initialValue: back.leituraaguaunidade.leituraanterior.toString(),
        decoration: InputDecoration(
          labelText: 'leituraanterior:',
        ));
  }

  Widget fieldLeituraatual(LeituraaguaunidadeFormController back) {
    return TextFormField(
        validator: back.validateLeituraatual,
        onSaved: (newValue) =>
            back.leituraaguaunidade.leituraatual = (newValue),
        onChanged: (value) => back.leituraaguaunidade.leituraatual = (value),
        initialValue: back.leituraaguaunidade.leituraatual.toString(),
        decoration: InputDecoration(
          labelText: 'leituraatual:',
        ));
  }

  Widget fieldValor(LeituraaguaunidadeFormController back) {
    return TextFormField(
        validator: back.validateValor,
        onSaved: (newValue) => back.leituraaguaunidade.valor = newValue,
        onChanged: (value) => back.leituraaguaunidade.valor = value,
        initialValue: back.leituraaguaunidade.valor.toString(),
        decoration: InputDecoration(
          labelText: 'Valor:',
        ));
  }

  Widget fieldCodigomedidor(LeituraaguaunidadeFormController back) {
    return TextFormField(
        keyboardType: TextInputType.number,
        validator: back.validateCodigomedidor,
        onSaved: (newValue) => back.leituraaguaunidade.codigomedidor = newValue,
        initialValue: back.leituraaguaunidade.codigomedidor.toString(),
        decoration: InputDecoration(
          labelText: 'codigomedidor:',
        ));
  }

  Widget fieldDataleitura(LeituraaguaunidadeFormController back) {
    return FormDatePicker(
      date: back.leituraaguaunidade.dataleitura ?? DateTime.now(),
      title: 'Data da leitura do consumo',
      onChanged: (value) {
        setState(() {
          var data = value.day.toString() +
              "/" +
              value.month.toString() +
              "/" +
              value.year.toString();
          back.leituraaguaunidade.dataleitura = value;
          print(back.leituraaguaunidade.dataleitura);
          print(data);
        });
      },
    );
  }

  final uriREST = Uri.parse(
      'https://apialugueis.herokuapp.com/Consultar/select * from pessoas order by nome');

  int idpessoa;
  var url;
  @override
  void initState() {
    super.initState();
    this.fetchStatus();
    this.fetchUnidadeImovel();
  }

  fetchStatus() async {
    //await Future.delayed(Duration(seconds: 3));
    var url = NomeServidoresApi.Api_Alugueis + 'Status';
    //print('voltou situação');
    var response = await http.get(Uri.parse(url));
    //print(response.body);
    if (response.statusCode == 200) {
      var items = json.decode(response.body);
      setState(() {
        _status = items;
        isStatusLoading = true;
      });
    } else {
      _status = [];
      isStatusLoading = false;
    }
  }

  fetchUnidadeImovel() async {
    var url = NomeServidoresApi.Api_Alugueis +
        'Consultar/select iu.idunidade,iu.descricao from imovelunidade iu';
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var items = json.decode(response.body);
      setState(() {
        _unidade = items;
        isUnidadeLoading = true;
      });
    } else {
      isUnidadeLoading = false;
      _unidade = [];
    }
  }

  @override
  Widget build(BuildContext context) {
    var _back = LeituraaguaunidadeFormController(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Consumos da Unidade'),
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
              fieldIdunidadeimovel(_back),
              fieldLeituraanterior(_back),
              fieldLeituraatual(_back),
              fieldCodigomedidor(_back),
              fieldDataleitura(_back),
              fieldValor(_back),
              fieldStatus(_back),
            ],
          ),
        ),
      ),
    );
  }
}
