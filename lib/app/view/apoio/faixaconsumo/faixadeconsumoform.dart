import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../../../../nomedosservidores.dart';
import 'faixadeconsumo_form_back.dart';

class FaixadeconsumoForm extends StatefulWidget {
  @override
  State<FaixadeconsumoForm> createState() => _FaixadeconsumoFormState();
}

class _FaixadeconsumoFormState extends State<FaixadeconsumoForm> {
  final _form = GlobalKey<FormState>();
  bool isImovelLoading = false;
  List<dynamic> _imovel = [
    {"idimovel": 1, "descricao": "selecione"}
  ];
  @override
  void initState() {
    super.initState();
    this.fetchImovel();
  }

  fetchImovel() async {
    var url = NomeServidoresApi.Api_Alugueis + 'Imovel';
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var items = json.decode(response.body);
      setState(() {
        _imovel = items;
        isImovelLoading = true;
      });
    } else {
      isImovelLoading = false;
      _imovel = [
        {"idimovel": 1, "descricao": "selecione"}
      ];
    }
  }

  Widget fieldIdimovelList(FaixadeconsumoFormBack back) {
    // print('Imovel');
    if (!isImovelLoading) {
      back.faixadeconsumo.idimovel = "1";
    }
    return DropdownButtonHideUnderline(
      child: ButtonTheme(
        alignedDropdown: true,
        child: DropdownButton<String>(
          value: back.faixadeconsumo.idimovel.toString(),
          iconSize: 30,
          icon: (null),
          borderRadius: BorderRadius.horizontal(),
          style: TextStyle(
            color: Colors.black54,
            fontSize: 16,
          ),
          hint: Text('Selecione o imovel'),
          onChanged: (String newValue) {
            setState(() {
              back.faixadeconsumo.idimovel = (newValue);
            });
          },
          items: _imovel?.map((item) {
                return new DropdownMenuItem(
                  child: new Text(item['descricao']),
                  value: item['idimovel'].toString(),
                );
              })?.toList() ??
              [],
        ),
      ),
    );
    /*} else {
      //print('nao leu categ');
      back.faixadeconsumo.idimovel = "1";
      return TextFormField(
          onSaved: (newValue) => back.faixadeconsumo.idimovel = (newValue),
          initialValue: "1",
          decoration: InputDecoration(
            labelText: 'Imovel:',
          ));
    }*/
  }

  Widget fieldIdfaixadeconsumo(FaixadeconsumoFormBack back) {
    return TextFormField(
        validator: back.validateIdfaixadeconsumo,
        onSaved: (newValue) =>
            back.faixadeconsumo.idfaixadeconsumo = (newValue),
        initialValue: back.faixadeconsumo.idfaixadeconsumo.toString(),
        decoration: InputDecoration(
          labelText: 'idfaixadeconsumo:',
        ));
  }

  Widget fieldDenominacao(FaixadeconsumoFormBack back) {
    return TextFormField(
        validator: back.validateDenominacao,
        onSaved: (newValue) => back.faixadeconsumo.denominacao = newValue,
        initialValue: back.faixadeconsumo.denominacao.toString(),
        decoration: InputDecoration(
          labelText: 'denominacao:',
        ));
  }

  Widget fieldFaixainicial(FaixadeconsumoFormBack back) {
    return TextFormField(
        validator: back.validateFaixainicial,
        onSaved: (newValue) => back.faixadeconsumo.faixainicial = (newValue),
        initialValue: back.faixadeconsumo.faixainicial.toString(),
        decoration: InputDecoration(
          labelText: 'faixainicial:',
        ));
  }

  Widget fieldFaixafinal(FaixadeconsumoFormBack back) {
    return TextFormField(
        validator: back.validateFaixafinal,
        onSaved: (newValue) => back.faixadeconsumo.faixafinal = (newValue),
        initialValue: back.faixadeconsumo.faixafinal.toString(),
        decoration: InputDecoration(
          labelText: 'faixafinal:',
        ));
  }

  Widget fieldTarifaagua(FaixadeconsumoFormBack back) {
    return TextFormField(
        validator: back.validateTarifaagua,
        onSaved: (newValue) =>
            back.faixadeconsumo.tarifaagua = double.parse(newValue),
        initialValue: back.faixadeconsumo.tarifaagua.toString(),
        decoration: InputDecoration(
          labelText: 'tarifaagua:',
        ));
  }

  Widget fieldTarifaesgoto(FaixadeconsumoFormBack back) {
    return TextFormField(
        validator: back.validateTarifaesgoto,
        onSaved: (newValue) =>
            back.faixadeconsumo.tarifaesgoto = double.parse(newValue),
        initialValue: back.faixadeconsumo.tarifaesgoto.toString(),
        decoration: InputDecoration(
          labelText: 'tarifaesgoto:',
        ));
  }

  Widget fieldtfdi(FaixadeconsumoFormBack back) {
    return TextFormField(
        validator: back.validatetfdi,
        onSaved: (newValue) =>
            back.faixadeconsumo.tfdi = double.parse(newValue),
        initialValue: back.faixadeconsumo.tfdi.toString(),
        decoration: InputDecoration(
          labelText: 'tfdi:',
        ));
  }

  Widget fieldIdimovel(FaixadeconsumoFormBack back) {
    return TextFormField(
        validator: back.validateIdimovel,
        onSaved: (newValue) => back.faixadeconsumo.idimovel = newValue,
        initialValue: back.faixadeconsumo.idimovel.toString(),
        decoration: InputDecoration(
          labelText: 'Imovel:',
        ));
  }

  @override
  Widget build(BuildContext context) {
    var _back = FaixadeconsumoFormBack(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Faixadeconsumo'),
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
              //fieldIdimovelList(_back),
              fieldDenominacao(_back),
              fieldFaixainicial(_back),
              fieldFaixafinal(_back),
              fieldTarifaagua(_back),
              fieldTarifaesgoto(_back),
              fieldtfdi(_back),
              fieldIdimovel(_back),
            ],
          ),
        ),
      ),
    );
  }
}
