import 'dart:convert';
import 'package:controlealuguel/app/domain/interfaces/pagamento_dao.dart';
import 'package:controlealuguel/src/models/pagamento/pagamentoPessoa.dart';
import 'package:controlealuguel/src/models/pagamento/pagamentos.dart';
import 'package:controlealuguel/src/utils/consultas_genericas.dart';
import 'package:http/http.dart' as http;

class PagamentoDAOPostgres implements PagamentoDAO {
  final uriREST = Uri.parse('https://apialugueis.herokuapp.com/Pagamentos');

  @override
  Future<List<Pagamentos>> find() async {
    var resposta = await http.get(uriREST);
    if (resposta.statusCode != 200) throw Exception('Erro REST API.');
    //print(resposta.body);
    Iterable listDart = json.decode(resposta.body);
    //print(listDart);
    var listPagto = List<Pagamentos>.from(listDart.map((map) => Pagamentos(
        idpagamento: map['idpagamento'],
        datapagamento: map['datapagamento'],
        valorpago: map['valorpago'],
        juros: map['juros'],
        desconto: map['desconto'],
        idcontrato: map['idcontrato'])));
    //print(listPagto);
    return listPagto;
  }

  @override
  remove(id) async {
    var uri = Uri.parse('https://apialugueis.herokuapp.com/pagamentosM/$id');
    var resposta = await http.delete(uri);
    if (resposta.statusCode != 200)
      throw Exception('Erro REST API Remove. $resposta.statusCode');
  }

  @override
  save(Pagamentos Pagto) async {
    //print('cheguei na api');
    print(Pagto);
    var headers = {'Content-Type': 'application/json'};
    var PagtoJson = jsonEncode({
      'idpagamento': Pagto.idpagamento,
      'datapagamento': Pagto.datapagamento,
      'valorpago': Pagto.valorpago,
      'juros': Pagto.juros,
      'desconto': Pagto.desconto,
      'idcontrato': Pagto.idcontrato
    });
    //print(Pagto.id);
    int statusCode = 0;

    if (Pagto.idpagamento == null) {
      print(PagtoJson);
      var resposta =
          await http.post(uriREST, headers: headers, body: PagtoJson);
      statusCode = resposta.statusCode;
    } else {
      var uri = Uri.parse(
          'https://apialugueis.herokuapp.com/pagamentosM/$Pagto.idpagamento');
      //print(uri);
      var resposta = await http.put(uri, headers: headers, body: PagtoJson);
      statusCode = resposta.statusCode;
    }
    if (statusCode != 200 && statusCode != 204)
      throw Exception('Erro REST API Salvar. $statusCode');
  }

  @override
  Future<List<PagamentosPessoa>> listar(idpessoa) async {
    var uri = Uri.parse(
        'https://apialugueis.herokuapp.com/Consultar/$vw_pagamentosPessoa where p.idpessoa=$idpessoa');
    var response = await http.delete(uri);
    final lista = response.body as List;
    final listaPagtosPessoa =
        lista.map((e) => PagamentosPessoa.fromMap(e)).toList();
    return listaPagtosPessoa;
  }
}
