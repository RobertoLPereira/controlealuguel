import 'dart:convert';

import 'package:http/http.dart' as http;
import '../../../src/models/bens/leituraluzunidade.dart';
import '../../../src/models/interfaces/bens/leituraluzunidade_interface.dart';
import 'package:uno/uno.dart';

class LeituraluzunidadeApi implements LeituraluzunidadeDAO {
  final uriREST =
      Uri.parse('https://apialugueis.herokuapp.com/leituraluzunidade');

  @override
  Future<List<Leituraluzunidade>> find() async {
    var resposta = await http.get(uriREST);
    if (resposta.statusCode != 200) throw Exception('Erro REST API.');
    Iterable listDart = json.decode(resposta.body);
    var listLeituraluzunidade = List<Leituraluzunidade>.from(
        listDart.map((leituraluzunidade) => Leituraluzunidade(
              idleituraluzunidade:
                  leituraluzunidade['idleituraluzunidade'].toString(),
              idunidadeimovel: leituraluzunidade['idunidadeimovel'].toString(),
              leituraanterior: leituraluzunidade['leituraanterior'],
              leituraatual: leituraluzunidade['leituraatual'],
              codigomedidor: leituraluzunidade['codigomedidor'].toString(),
              dataleitura: leituraluzunidade['dataleitura'],
              status: leituraluzunidade['status'].toString(),
              valor: leituraluzunidade['valor'],
            )));
    return listLeituraluzunidade;
  }

  final Uno uno;

  LeituraluzunidadeApi(this.uno);
  Future<List<Leituraluzunidade>> fetchLeituraluzunidade() async {
    final response =
        await uno.get('https://apialugueis.herokuapp.com/Leituraluzunidade');
    final lista = response.data as List;
    final listaLeituraluzunidade =
        lista.map((e) => Leituraluzunidade.fromMap(e)).toList();
    return listaLeituraluzunidade;
  }

  @override
  remove(id) async {
    var uri =
        Uri.parse('https://apialugueis.herokuapp.com/leituraluzunidade/$id');
    var resposta = await http.delete(uri);
    if (resposta.statusCode != 200) throw Exception('Erro REST API.');
  }

  @override
  save(Leituraluzunidade leituraluzunidade) async {
    var headers = {'Content-Type': 'application/json'};
    var leituraluzunidadeJson = jsonEncode({
      'idleituraluzunidade': int.parse(leituraluzunidade.idleituraluzunidade),
      'idunidadeimovel': int.parse(leituraluzunidade.idunidadeimovel),
      'leituraanterior': leituraluzunidade.leituraanterior,
      'leituraatual': leituraluzunidade.leituraatual,
      'codigomedidor': int.parse(leituraluzunidade.codigomedidor),
      'dataleitura': leituraluzunidade.dataleitura,
      'status': int.parse(leituraluzunidade.status),
      'valor': leituraluzunidade.valor,
    });
    int statusCode = 0;
    if (leituraluzunidade.idleituraluzunidade == null) {
      var resposta = await http.post(uriREST,
          headers: headers, body: leituraluzunidadeJson);
      statusCode = resposta.statusCode;
    } else {
      var resposta = await http.put(uriREST,
          headers: headers, body: leituraluzunidadeJson);
      statusCode = resposta.statusCode;
    }
    if (statusCode != 200 && statusCode != 204)
      throw Exception('Erro REST API.');
  }

  @override
  Future<List<Leituraluzunidade>> buscarLeituraluzunidade() {
    // ignore: todo
    // TODO: implement buscarLeituraluzunidade
    throw UnimplementedError();
  }
}
