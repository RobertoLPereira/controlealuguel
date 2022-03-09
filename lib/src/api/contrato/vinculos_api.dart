import 'dart:convert';

import 'package:http/http.dart' as http;
import '../../../src/models/interfaces/vinculos_interface.dart';
import '../../../src/models/pessoas/vinculos.dart';
import 'package:uno/uno.dart';

class VinculosApi implements VinculosDAO {
  final uriREST = Uri.parse('https://apialugueis.herokuapp.com/vinculos');

  @override
  Future<List<Vinculos>> find() async {
    var resposta = await http.get(uriREST);
    if (resposta.statusCode != 200) throw Exception('Erro REST API.');
    Iterable listDart = json.decode(resposta.body);
    var listVinculos = List<Vinculos>.from(listDart.map((vinculos) => Vinculos(
          idvinculo: vinculos['idvinculo'],
          idnaturezarelac: vinculos['idnaturezarelac'],
          idpessoa: vinculos['idpessoa'],
          inicio: vinculos['inicio'],
          fim: vinculos['fim'],
          idimovel: vinculos['idimovel'],
        )));
    return listVinculos;
  }

  final Uno uno;

  VinculosApi(this.uno);
  Future<List<Vinculos>> fetchVinculos() async {
    final response =
        await uno.get('https://apialugueis.herokuapp.com/Vinculos');
    final lista = response.data as List;
    final listaVinculos = lista.map((e) => Vinculos.fromMap(e)).toList();
    return listaVinculos;
  }

  @override
  remove(id) async {
    var uri = Uri.parse('https://apialugueis.herokuapp.com/vinculos/$id');
    var resposta = await http.delete(uri);
    if (resposta.statusCode != 200) throw Exception('Erro REST API.');
  }

  @override
  save(Vinculos vinculos) async {
    var headers = {'Content-Type': 'application/json'};
    var vinculosJson = jsonEncode({
      'idvinculo': vinculos.idvinculo,
      'idnaturezarelac': vinculos.idnaturezarelac,
      'idpessoa': vinculos.idpessoa,
      'inicio': vinculos.inicio,
      'fim': vinculos.fim,
      'idimovel': vinculos.idimovel,
    });
    int statusCode = 0;
    if (vinculos.idvinculo == null) {
      var resposta =
          await http.post(uriREST, headers: headers, body: vinculosJson);
      statusCode = resposta.statusCode;
    } else {
      var resposta =
          await http.put(uriREST, headers: headers, body: vinculosJson);
      statusCode = resposta.statusCode;
    }
    if (statusCode != 200) throw Exception('Erro REST API.');
  }

  @override
  Future<List<Vinculos>> buscarVinculos() {
    // ignore: todo
    // TODO: implement buscarVinculos
    throw UnimplementedError();
  }
}
