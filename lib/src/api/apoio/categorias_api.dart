import 'dart:convert';
import 'package:controlealuguel/src/models/apoio/categorias.dart';
import 'package:controlealuguel/src/models/interfaces/apoio/categorias_interface.dart';
import 'package:http/http.dart' as http;
import 'package:uno/uno.dart';

class CategoriasAPI implements CategoriasIterface {
  final Uno uno;

  CategoriasAPI(this.uno);

  final uriREST =
      Uri.parse('https://apialugueis.herokuapp.com/Categoriadeimoveis');

  @override
  remove(id) async {
    var uri =
        Uri.parse('https://apialugueis.herokuapp.com/Categoriadeimoveis/$id');
    var resposta = await http.delete(uri);
    if (resposta.statusCode != 200) throw Exception('Erro REST API.');
  }

  @override
  save(categorias) async {
    var headers = {'Content-Type': 'application/json'};
    var CategoriasJson = jsonEncode({
      'idCategorias': categorias.idcategoriadeimoveis,
      'denominacao': categorias.denominacao,
    });
    int statusCode = 0;
    if (categorias.idcategoriadeimoveis == null) {
      var resposta =
          await http.post(uriREST, headers: headers, body: CategoriasJson);
      statusCode = resposta.statusCode;
    } else {
      var resposta =
          await http.put(uriREST, headers: headers, body: CategoriasJson);
      statusCode = resposta.statusCode;
    }
    if (statusCode != 200) throw Exception('Erro REST API.');
  }

  @override
  Future<List<Categorias>> find() async {
    final response =
        await uno.get('https://apialugueis.herokuapp.com/Categoriadeimoveis');
    if (response.status != 200) {
      print(response.status);
    }
    final lista = response.data as List;
    final listaCategorias = lista.map((e) => Categorias.fromMap(e)).toList();
    return listaCategorias;
  }
}
