import 'dart:convert';

import '../../../src/models/interfaces/apoio/centrocusto_interface.dart';
import 'package:http/http.dart' as http;
import '../../../src/models/apoio/centrocusto.dart';
import 'package:uno/uno.dart';

class CentrocustoApi implements CentrocustoDAO {
  final uriREST = Uri.parse('https://apialugueis.herokuapp.com/centrocusto');

  @override
  Future<List<Centrocusto>> find() async {
    var resposta = await http.get(uriREST);
    if (resposta.statusCode != 200) throw Exception('Erro REST API.');
    Iterable listDart = json.decode(resposta.body);
    var listCentrocusto =
        List<Centrocusto>.from(listDart.map((centrocusto) => Centrocusto(
              id: centrocusto['id'],
              idtaxaadm: centrocusto['idtaxaadm'],
              idpagamento: centrocusto['idpagamento'],
              valor: centrocusto['valor'],
            )));
    return listCentrocusto;
  }

  final Uno uno;

  CentrocustoApi(this.uno);
  Future<List<Centrocusto>> fetchCentrocusto() async {
    final response =
        await uno.get('https://apialugueis.herokuapp.com/Centrocusto');
    final lista = response.data as List;
    final listaCentrocusto = lista.map((e) => Centrocusto.fromMap(e)).toList();
    return listaCentrocusto;
  }

  @override
  remove(id) async {
    var uri = Uri.parse('https://apialugueis.herokuapp.com/centrocusto/$id');
    var resposta = await http.delete(uri);
    if (resposta.statusCode != 200) throw Exception('Erro REST API.');
  }

  @override
  save(Centrocusto centrocusto) async {
    var headers = {'Content-Type': 'application/json'};
    var centrocustoJson = jsonEncode({
      'id': centrocusto.id,
      'idtaxaadm': centrocusto.idtaxaadm,
      'idpagamento': centrocusto.idpagamento,
      'valor': centrocusto.valor,
    });
    int statusCode = 0;
    if (centrocusto.id == null) {
      var resposta =
          await http.post(uriREST, headers: headers, body: centrocustoJson);
      statusCode = resposta.statusCode;
    } else {
      var resposta =
          await http.put(uriREST, headers: headers, body: centrocustoJson);
      statusCode = resposta.statusCode;
    }
    if (statusCode != 200) throw Exception('Erro REST API.');
  }

  @override
  Future<List<Centrocusto>> buscarCentrocusto() {
    // ignore: todo
    // TODO: implement buscarCentrocusto
    throw UnimplementedError();
  }
}
