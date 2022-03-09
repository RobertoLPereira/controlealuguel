import 'dart:convert';

import 'package:controlealuguel/app/domain/entities/imovel.dart';
import 'package:controlealuguel/src/models/pessoas/pessoas.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ComboboxPage extends StatefulWidget {
  @override
  _ComboboxPageState createState() => _ComboboxPageState();
}

class _ComboboxPageState extends State<ComboboxPage> {
  Map<String, List<Map<String, Object>>> wPessoas = {
    "Pessoa": [
      {"idpessoa": 0, "nome": ''}
    ]
  };
  Map<String, List<Map<String, Object>>> wImoveis = {
    "Imovel": [
      {"idimovel": 0, "descricao": ''}
    ]
  };
  @override
  void initState() {
    _getStateList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dynamic DropDownList REST API'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            alignment: Alignment.topCenter,
            margin: EdgeInsets.only(bottom: 100, top: 100),
            child: Text(
              'KDTechs',
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
            ),
          ),
          //======================================================== State

          Container(
            padding: EdgeInsets.only(left: 15, right: 15, top: 5),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: DropdownButtonHideUnderline(
                    child: ButtonTheme(
                      alignedDropdown: true,
                      child: DropdownButton<String>(
                        value: _myState,
                        iconSize: 30,
                        icon: (null),
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 16,
                        ),
                        hint: Text('Select State'),
                        onChanged: (String newValue) {
                          setState(() {
                            _myState = newValue;
                            _getCitiesList(cityInfoUrl);
                            print(_myState);
                          });
                        },
                        items: statesList?.map((item) {
                              return new DropdownMenuItem(
                                child: new Text(item['nome']),
                                value: item['idpessoa'].toString(),
                              );
                            })?.toList() ??
                            [],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),

          //======================================================== City

          Container(
            padding: EdgeInsets.only(left: 15, right: 15, top: 5),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: DropdownButtonHideUnderline(
                    child: ButtonTheme(
                      alignedDropdown: true,
                      child: DropdownButton<String>(
                        value: _myCity,
                        iconSize: 30,
                        icon: (null),
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 16,
                        ),
                        hint: Text('Select City'),
                        onChanged: (String newValue) {
                          setState(() {
                            _myCity = newValue;
                            print(_myCity);
                          });
                        },
                        items: citiesList?.map((item) {
                              print(item['descricao']);
                              return new DropdownMenuItem(
                                child: new Text(item['descricao']),
                                value: item['idimovel'].toString(),
                              );
                            })?.toList() ??
                            [],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  //=============================================================================== Api Calling here

//CALLING STATE API HERE
// Get State information by API
  List statesList;
  String _myState;

  String stateInfoUrl = 'https://apialugueis.herokuapp.com/Pessoas';

  // ignore: missing_return
  Future<String> _getStateList() async {
    final uriREST = Uri.parse(stateInfoUrl);
    await http.get(uriREST).then((response) {
      // ignore: unused_local_variable
      var data = json.decode(response.body);
      Iterable listDart = json.decode(response.body);

      // ignore: unused_local_variable
      var list = List<Pessoas>.from(listDart.map((pes) {
        var p = {"idpessoa": pes['idpessoa'], "nome": pes['nome']};
        wPessoas['Pessoa'].add(p);
      }));
      setState(() {
        statesList = wPessoas['Pessoa'];
      });
    });
  }

  // Get State information by API
  List citiesList;
  String _myCity;

  String cityInfoUrl = 'https://apialugueis.herokuapp.com/Imovel/';
  // ignore: missing_return
  Future<String> _getCitiesList(String url) async {
    final uriREST = Uri.parse(url);
    await http.get(uriREST).then((response) {
      Iterable listDart = json.decode(response.body);
      //print(response.body);
      //if (wImoveis.isNotEmpty) wImoveis.clear();
      // ignore: unused_local_variable
      var list = List<Imovel>.from(listDart.map((imov) {
        //print(imov['idproprietario'] + _myState);
        if (imov['idproprietario'].toString() == _myState) {
          var p = {
            "idimovel": imov['idimovel'],
            "descricao": imov['descricao']
          };
          wImoveis['Imovel'].add(p);
        }
      }));
      setState(() {
        citiesList = wImoveis['Imovel'];
      });
    });
  }
}
