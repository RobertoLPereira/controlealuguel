import 'dart:convert';

import 'package:http/http.dart' as http;
import '../../../src/models/apoio/taxaadministracao.dart';
import '../../../src/models/interfaces/apoio/taxaadministracao_interface.dart';
import 'package:uno/uno.dart';

class TaxaadministracaoApi implements TaxaadministracaoDAO {
  final uriREST =
      Uri.parse('https://apialugueis.herokuapp.com/taxaadministracao');

  @override
  Future<List<Taxaadministracao>> find() async {
    var resposta = await http.get(uriREST);
    if (resposta.statusCode != 200) throw Exception('Erro REST API.');
    Iterable listDart = json.decode(resposta.body);
    var listTaxaadministracao = List<Taxaadministracao>.from(
        listDart.map((taxaadministracao) => Taxaadministracao(
              id: taxaadministracao['id'],
              idfavorecido: taxaadministracao['idfavorecido'],
              taxa: taxaadministracao['taxa'],
              valor: taxaadministracao['valor'],
              idcontrato: taxaadministracao['idcontrato'],
              situacao: taxaadministracao['situacao'],
            )));
    return listTaxaadministracao;
  }

  final Uno uno;

  TaxaadministracaoApi(this.uno);
  Future<List<Taxaadministracao>> fetchTaxaadministracao() async {
    final response =
        await uno.get('https://apialugueis.herokuapp.com/Taxaadministracao');
    final lista = response.data as List;
    final listaTaxaadministracao =
        lista.map((e) => Taxaadministracao.fromMap(e)).toList();
    return listaTaxaadministracao;
  }

  @override
  remove(id) async {
    var uri =
        Uri.parse('https://apialugueis.herokuapp.com/taxaadministracao/$id');
    var resposta = await http.delete(uri);
    if (resposta.statusCode != 200) throw Exception('Erro REST API.');
  }

  @override
  save(Taxaadministracao taxaadministracao) async {
    var headers = {'Content-Type': 'application/json'};
    var taxaadministracaoJson = jsonEncode({
      'id': taxaadministracao.id,
      'idfavorecido': taxaadministracao.idfavorecido,
      'taxa': taxaadministracao.taxa.toString().replaceAll(RegExp(r','), '.')
          as double,
      'valor': taxaadministracao.valor.toString().replaceAll(RegExp(r','), '.')
          as double,
      'idcontrato': taxaadministracao.idcontrato,
      'situacao': taxaadministracao.situacao,
    });
    int statusCode = 0;
    if (taxaadministracao.id == null) {
      var resposta = await http.post(uriREST,
          headers: headers, body: taxaadministracaoJson);
      statusCode = resposta.statusCode;
    } else {
      var resposta = await http.put(uriREST,
          headers: headers, body: taxaadministracaoJson);
      statusCode = resposta.statusCode;
    }
    if (statusCode != 200)
      throw Exception('Erro REST API.' + statusCode.toString());
  }

  @override
  Future<List<Taxaadministracao>> buscarTaxaadministracao() {
    // ignore: todo
    // TODO: implement buscarTaxaadministracao
    throw UnimplementedError();
  }
}
