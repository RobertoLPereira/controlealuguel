import 'dart:convert';

import 'package:http/http.dart' as http;
import '../../../src/models/bens/leituraaguaunidade.dart';
import '../../../src/models/interfaces/bens/leituraaguaunidade_interface.dart';
import 'package:uno/uno.dart';

class LeituraaguaunidadeApi implements LeituraaguaunidadeDAO {
  final uriREST =
      Uri.parse('https://apialugueis.herokuapp.com/Leituraaguaunidade');

  @override
  Future<List<LeituraAguaUnidade>> find() async {
    var resposta = await http.get(uriREST);
    if (resposta.statusCode != 200) throw Exception('Erro REST API.');
    Iterable listDart = json.decode(resposta.body);
    var listLeituraaguaunidade = List<LeituraAguaUnidade>.from(
        listDart.map((leituraaguaunidade) => LeituraAguaUnidade(
              idleituraaguaunidade:
                  leituraaguaunidade['idleituraaguaunidade'].toString(),
              idunidadeimovel: leituraaguaunidade['idunidadeimovel'],
              leituraanterior: leituraaguaunidade['leituraanterior'].toString(),
              leituraatual: leituraaguaunidade['leituraatual'].toString(),
              codigomedidor: leituraaguaunidade['codigomedidor'].toString(),
              dataleitura: leituraaguaunidade['dataleitura'] as DateTime,
              status: leituraaguaunidade['status'].toString(),
              valor: leituraaguaunidade['valor'].toString(),
            )));
    return listLeituraaguaunidade;
  }

  final Uno uno;

  LeituraaguaunidadeApi(this.uno);
  Future<List<LeituraAguaUnidade>> fetchLeituraaguaunidade() async {
    final response =
        await uno.get('https://apialugueis.herokuapp.com/Leituraaguaunidade');
    final lista = response.data as List;
    final listaLeituraaguaunidade =
        lista.map((e) => LeituraAguaUnidade.fromMap(e)).toList();
    return listaLeituraaguaunidade;
  }

  @override
  remove(id) async {
    var uri =
        Uri.parse('https://apialugueis.herokuapp.com/leituraaguaunidade/$id');
    var resposta = await http.delete(uri);
    if (resposta.statusCode != 200) throw Exception('Erro REST API.');
  }

  @override
  save(LeituraAguaUnidade leituraaguaunidade) async {
    var headers = {'Content-Type': 'application/json'};
    var leituraaguaunidadeJson = jsonEncode({
      'idleituraaguaunidade': (leituraaguaunidade.idleituraaguaunidade),
      'idunidadeimovel': (leituraaguaunidade.idunidadeimovel),
      'leituraanterior': double.parse(leituraaguaunidade.leituraanterior),
      'leituraatual': double.parse(leituraaguaunidade.leituraatual),
      'codigomedidor': int.parse(leituraaguaunidade.codigomedidor),
      'dataleitura': leituraaguaunidade.dataleitura,
      'status': int.parse(leituraaguaunidade.status),
      'valor': double.parse(leituraaguaunidade.valor),
    });
    print('salvar leitura');
    print(leituraaguaunidadeJson);
    int statusCode = 0;
    if (leituraaguaunidade.idleituraaguaunidade == null) {
      var resposta = await http.post(uriREST,
          headers: headers, body: leituraaguaunidadeJson);
      statusCode = resposta.statusCode;
    } else {
      var resposta = await http.put(uriREST,
          headers: headers, body: leituraaguaunidadeJson);
      statusCode = resposta.statusCode;
    }
    if (statusCode != 200 && statusCode != 204)
      throw Exception('Erro REST API.');
  }

  @override
  Future<List<LeituraAguaUnidade>> buscarLeituraaguaunidade() {
    // ignore: todo
    // TODO: implement buscarLeituraaguaunidade
    throw UnimplementedError();
  }
}
