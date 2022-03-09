import 'dart:convert';
import 'package:controlealuguel/src/models/apoio/categorias.dart';
import '../../domain/interfaces/categoriadeimoveis_dao.dart';
import 'package:http/http.dart' as http;

class CategoriadeImoveisDAOMySQL implements CategoriadeImoveisDAO {
  final uriREST =
      Uri.parse('https://apialugueis.herokuapp.com/Categoriadeimoveis');

  @override
  Future<List<Categorias>> find() async {
    var resposta = await http.get(uriREST);
    if (resposta.statusCode != 200) throw Exception('Erro REST API.');
    //print(resposta.body);
    Iterable listDart = json.decode(resposta.body);
    //print(listDart);
    var listCateg = List<Categorias>.from(listDart.map((item) => Categorias(
        idcategoriadeimoveis: item['idcategoriadeimoveis'],
        denominacao: item['denominacao'])));
    //print(listStatus);
    return listCateg;
  }

  @override
  remove(id) async {
    var uri =
        Uri.parse('https://apialugueis.herokuapp.com/Categoriadeimoveis/$id');
    var resposta = await http.delete(uri);
    if (resposta.statusCode != 200)
      throw Exception('Erro REST API Remove. $resposta.statusCode');
  }

  @override
  save(Categorias categoriadeimoveis) async {
    //print(status);
    var headers = {'Content-Type': 'application/json'};
    var statusJson = jsonEncode({
      'idcategoriadeimoveis': categoriadeimoveis.idcategoriadeimoveis,
      'denominacao': categoriadeimoveis.denominacao
    });
    //print(categoriadeimoveis);
    int statusCode = 0;

    if (categoriadeimoveis.idcategoriadeimoveis == null) {
      //print(statusJson);
      var resposta =
          await http.post(uriREST, headers: headers, body: statusJson);
      statusCode = resposta.statusCode;
    } else {
      var url = 'https://apialugueis.herokuapp.com/categoriadeimoveisM/' +
          categoriadeimoveis.idcategoriadeimoveis.toString();
      var uri = Uri.parse(url);
      var resposta = await http.put(uri, headers: headers, body: statusJson);
      statusCode = resposta.statusCode;
    }
    if (statusCode != 200 && statusCode != 204) {
      throw Exception('Erro REST API Salvar. $statusCode');
    }
  }
}
