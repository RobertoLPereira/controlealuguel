import 'dart:convert';
import '../../models/bens/leituraaguaunidade.dart';
import 'package:controlealuguel/nomedosservidores.dart';
import 'package:http/http.dart' as http;
import 'leituradeconsumo_interface.dart';

class LeituraDeConsumoApi implements LeituraDeConsumoInterface {
  final uriREST =
      Uri.parse(NomeServidoresApi.Api_Alugueis + '/leituraaguaunidade');

  @override
  Future<List<LeituraAguaUnidade>> find() async {
    var resposta = await http.get(uriREST);
    if (resposta.statusCode != 200) throw Exception('Erro REST API.');
    Iterable listDart = json.decode(resposta.body);
    var listLeituraaguaunidade = List<LeituraAguaUnidade>.from(
        listDart.map((leituraaguaunidade) => LeituraAguaUnidade(
              idleituraaguaunidade: leituraaguaunidade['idleituraaguaunidade'],
              idunidadeimovel: leituraaguaunidade['idunidadeimovel'],
              leituraanterior: leituraaguaunidade['leituraanterior'],
              leituraatual: leituraaguaunidade['leituraatual'],
              codigomedidor: leituraaguaunidade['codigomedidor'],
              dataleitura: leituraaguaunidade['dataleitura'],
              status: leituraaguaunidade['status'],
            )));
    return listLeituraaguaunidade;
  }

  @override
  remove(id) async {
    var uri =
        Uri.parse(NomeServidoresApi.Api_Alugueis + '/leituraaguaunidade/$id');
    var resposta = await http.delete(uri);
    if (resposta.statusCode != 204) throw Exception('Erro REST API.');
  }

  @override
  save(LeituraAguaUnidade leituraaguaunidade) async {
    var headers = {'Content-Type': 'application/json'};
    var leituraaguaunidadeJson = jsonEncode({
      'idunidadeimovel': leituraaguaunidade.idunidadeimovel,
      'leituraanterior': leituraaguaunidade.leituraanterior,
      'leituraatual': leituraaguaunidade.leituraatual,
      'codigomedidor': leituraaguaunidade.codigomedidor,
      'dataleitura': leituraaguaunidade.dataleitura,
      'status': leituraaguaunidade.status,
    });
    int statusCode = 0;
    if (leituraaguaunidade.idleituraaguaunidade == null) {
      var resposta = await http.post(uriREST,
          headers: headers, body: leituraaguaunidadeJson);
      statusCode = resposta.statusCode;
    } else {
      var uri = Uri.parse(NomeServidoresApi.Api_Alugueis +
          '/leituraaguaunidade/$leituraaguaunidade.idleituraaguaunidade');
      var resposta =
          await http.put(uri, headers: headers, body: leituraaguaunidadeJson);
      statusCode = resposta.statusCode;
    }
    if (statusCode != 200 && statusCode != 204)
      throw Exception('Erro REST API.');
  }

  @override
  Future<List<LeituraAguaUnidade>> buscarLeituraaguaunidade() {
    // ignore: todo
    // TODO: implement buscarILeituraaguaunidade
    throw UnimplementedError();
  }
}
