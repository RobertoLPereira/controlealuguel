import 'dart:convert';
import 'package:controlealuguel/nomedosservidores.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'imovel_form_controller.dart';

class ImovelForm extends StatefulWidget {
  @override
  State<ImovelForm> createState() => _ImovelFormState();
}

class _ImovelFormState extends State<ImovelForm> {
  final _form = GlobalKey<FormState>();
  bool isLoading = false;
  bool isStatusLoading = false;
  bool isCategLoading = false;
  List<dynamic> prop = [];
  List<dynamic> _status = [];
  List<dynamic> _categoria = [];
  Widget fieldDescricao(ImovelFormController back) {
    return TextFormField(
        validator: back.validateDescricao,
        onSaved: (newValue) => back.imovelwrap.descricao = newValue,
        initialValue: back.imovelwrap.descricao,
        decoration: InputDecoration(
          labelText: 'descricao:',
        ));
  }

  Widget fieldEndereco(ImovelFormController back) {
    return TextFormField(
        validator: back.validateEndereco,
        onSaved: (newValue) => back.imovelwrap.endereco = newValue,
        initialValue: back.imovelwrap.endereco,
        decoration: InputDecoration(
          labelText: 'endereco:',
        ));
  }

  Widget fieldProp(ImovelFormController back) {
    return DropdownButtonHideUnderline(
      child: ButtonTheme(
        alignedDropdown: true,
        child: DropdownButton<String>(
          value: back.imovelwrap.idproprietario.toString(),
          iconSize: 30,
          icon: (null),
          borderRadius: BorderRadius.horizontal(),
          style: TextStyle(
            color: Colors.black54,
            fontSize: 16,
          ),
          hint: Text('Selecione o Proprietário'),
          onChanged: (String newValue) {
            setState(() {
              back.imovelwrap.idproprietario = int.parse(newValue);
            });
          },
          items: prop?.map((item) {
                return new DropdownMenuItem(
                  child: new Text(item['nome']),
                  value: item['idpessoa'].toString(),
                );
              })?.toList() ??
              [],
        ),
      ),
    );
  }

  Widget fieldStatus(ImovelFormController back) {
    // print('Situação');
    if (isStatusLoading) {
      //print(_status);
      return DropdownButtonHideUnderline(
        child: ButtonTheme(
          alignedDropdown: true,
          child: DropdownButton<String>(
            value: back.imovelwrap.status.toString(),
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
                back.imovelwrap.status = int.parse(newValue);
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
          onSaved: (newValue) => back.imovelwrap.status = int.parse(newValue),
          initialValue: "1",
          decoration: InputDecoration(
            labelText: 'Situação:',
          ));
    }
  }

  Widget fieldSituacao(ImovelFormController back) {
    return TextFormField(
        onSaved: (newValue) => back.imovelwrap.status = int.parse(newValue),
        initialValue: "1",
        decoration: InputDecoration(
          labelText: 'Situação:',
        ));
  }

  Widget fieldIdimovelcategoria(ImovelFormController back) {
    // print('categoria');
    if (isCategLoading) {
      return DropdownButtonHideUnderline(
        child: ButtonTheme(
          alignedDropdown: true,
          child: DropdownButton<String>(
            value: back.imovelwrap.idimovelcategoria.toString(),
            iconSize: 30,
            icon: (null),
            borderRadius: BorderRadius.horizontal(),
            style: TextStyle(
              color: Colors.black54,
              fontSize: 16,
            ),
            hint: Text('Selecione a categoria do imovel'),
            onChanged: (String newValue) {
              setState(() {
                back.imovelwrap.idimovelcategoria = int.parse(newValue);
              });
            },
            items: _categoria?.map((item) {
                  return new DropdownMenuItem(
                    child: new Text(item['denominacao']),
                    value: item['idcategoriadeimoveis'].toString(),
                  );
                })?.toList() ??
                [],
          ),
        ),
      );
    } else {
      //print('nao leu categ');
      return TextFormField(
          onSaved: (newValue) =>
              back.imovelwrap.idimovelcategoria = int.parse(newValue),
          initialValue: "1",
          decoration: InputDecoration(
            labelText: 'Categoria:',
          ));
    }
  }

  Widget fieldCategoria(ImovelFormController back) {
    return TextFormField(
        onSaved: (newValue) =>
            back.imovelwrap.idimovelcategoria = int.parse(newValue),
        initialValue: "1",
        decoration: InputDecoration(
          labelText: 'Categoria:',
        ));
  }

  Widget fieldQtdUnidade(ImovelFormController back) {
    return TextFormField(
        onSaved: (newValue) => back.imovelwrap.qtdunidade = int.parse(newValue),
        initialValue: "0",
        decoration: InputDecoration(
          labelText: 'Quantidade de Unidades:',
        ));
  }

  Widget fieldNomeUnidade(ImovelFormController back) {
    return TextFormField(
        onSaved: (newValue) => back.imovelwrap.nomeunidade = newValue,
        initialValue: back.imovelwrap.nomeunidade,
        decoration: InputDecoration(
          labelText: 'Tipo de Unidade:',
        ));
  }

  final uriREST = Uri.parse(
      'https://apialugueis.herokuapp.com/Consultar/select * from pessoas order by nome');

  int idpessoa;
  var url;
  @override
  void initState() {
    super.initState();
    this.fetchUser();
    this.fetchStatus();
    this.fetchCategoria();
  }

  fetchUser() async {
    var response = await http.get(uriREST);
    if (response.statusCode == 200) {
      var items = json.decode(response.body);
      setState(() {
        prop = items;
        isLoading = true;
      });
    } else {
      prop = [];
      isLoading = false;
    }
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

  fetchCategoria() async {
    var url = NomeServidoresApi.Api_Alugueis + 'Categoriadeimoveis';
    var response = await http.get(Uri.parse(url));
    //print('voltou categoria');
    if (response.statusCode == 200) {
      var items = json.decode(response.body);
      setState(() {
        _categoria = items;
        isCategLoading = true;
      });
    } else {
      isCategLoading = false;
      _categoria = [];
    }
  }

  @override
  Widget build(BuildContext context) {
    var _back = ImovelFormController(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Imovel'),
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
              fieldProp(_back),
              fieldDescricao(_back),
              fieldEndereco(_back),
              fieldStatus(_back),
              fieldIdimovelcategoria(_back),
              fieldQtdUnidade(_back),
              fieldNomeUnidade(_back),
            ],
          ),
        ),
      ),
    );
  }
}
