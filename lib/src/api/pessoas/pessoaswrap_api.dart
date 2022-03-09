import 'dart:convert';

import 'package:controlealuguel/app/domain/interfaces/pessoas_wrap_dao.dart';
import 'package:controlealuguel/src/models/pagamento/pagamentoPessoa.dart';
import 'package:controlealuguel/src/models/pessoas/pessoas_wrap.dart';
import 'package:controlealuguel/src/utils/consultas_genericas.dart';
import 'package:http/http.dart' as http;
import 'package:uno/uno.dart';

class PessoasWrapApi implements PessoasWrapDAO {
  final uriREST = Uri.parse(
      'https://apialugueis.herokuapp.com/Consultar/' + vw_listacontatosWrap);

  @override
  Future<List<PessoasWrap>> find() async {
    var resposta = await http.get(uriREST);
    if (resposta.statusCode != 200) throw Exception('Erro REST API.');
    Iterable listDart = json.decode(resposta.body);
    var listPessoasWrap = List<PessoasWrap>.from(listDart.map((json) =>
        PessoasWrap(
            idcontrato: json['idcontrato'],
            idunidadeimovel: json['idunidadeimovel'],
            idlocador: json['idlocador'],
            idlocatario: json['idlocatario'],
            diavencimento: json['diavencimento'],
            datacontrato: json['datacontrato'],
            status: json['status'],
            validadecontrato: json['validadecontrato'],
            valor: json['valor'],
            taxacondominio: json['taxacondominio'],
            valordecaucao: json['valordecaucao'],
            idpessoa: json['idpessoa'],
            nome: json['nome'],
            telefone: json['telefone'],
            proprietario: json['proprietario'],
            cadastradoem: json['cadastradoem'],
            urlAvatar: json['url_avatar'],
            unidade: json['unidade'],
            imovel: json['imovel'],
            enddereco: json['enddereco'],
            pago: json['pago'])));
    //print(listPessoasWrap);
    return listPessoasWrap;
  }

  final Uno uno;

  PessoasWrapApi(this.uno);
  Future<List<PessoasWrap>> fetchPessoasWrap() async {
    final response = await uno.get(
        'https://apialugueis.herokuapp.com/Consultar/$vw_listacontatosWrap');
    final lista = response.data as List;
    final listaPessas = lista.map((e) => PessoasWrap.fromMap(e)).toList();
    return listaPessas;
  }

  @override
  save(PessoasWrap pessoasWrap) async {
    print('salvar pessoa');
    var headers = {'Content-Type': 'application/json'};
    var pessoasWrapJson = jsonEncode({
      'idpessoa': pessoasWrap.idpessoa,
      'nome': pessoasWrap.nome,
      'telefone': pessoasWrap.telefone,
      'email': pessoasWrap.email,
      'url_avatar': pessoasWrap.urlAvatar,
      'proprietario': pessoasWrap.proprietario,
      'cadastradoem': pessoasWrap.cadastradoem,
      'status': pessoasWrap.status
    });
    //print(pessoasWrap.idpessoa);
    int statusCode = 0;
    var uri = Uri.parse('https://apialugueis.herokuapp.com/Pessoas');
    print(uri);
    if (pessoasWrap.idpessoa == null) {
      //print(pessoasWrapJson);
      var resposta =
          await http.post(uri, headers: headers, body: pessoasWrapJson);
      statusCode = resposta.statusCode;
    } else {
      print('vou atualizar pessoa');
      print(pessoasWrap.idpessoa);
      var resposta =
          await http.put(uri, headers: headers, body: pessoasWrapJson);
      statusCode = resposta.statusCode;
    }
    if (statusCode != 200 && statusCode != 204)
      throw Exception('Erro REST API Salvar Pessoa. $statusCode');
  }

  @override
  reativar(idpessoa) async {
    var uri =
        Uri.parse('https://apialugueis.herokuapp.com/AtivarPessoa/$idpessoa');
    var resposta = await http.put(uri);
    if (resposta.statusCode != 200)
      throw Exception('Erro REST API Remove. $resposta.statusCode');
  }

  @override
  remove(idpessoa) async {
    print(idpessoa);
    var uri = Uri.parse(
        'https://apialugueis.herokuapp.com/DesativarPessoa/$idpessoa');
    var resposta = await http.put(uri);
    if (resposta.statusCode != 200)
      throw Exception('Erro REST API Remove. $resposta.statusCode');
  }

  @override
  Future<List<PagamentosPessoa>> listar(idpessoa) async {
    var uri = Uri.parse(
        'https://apialugueis.herokuapp.com/Consultar/$vw_pagamentosPessoa where p.idpessoa=$idpessoa');
    var response = await http.get(uri);
    //print(response.body);
    Iterable listDart = json.decode(response.body);
    var listaPagtosPessoa = List<PagamentosPessoa>.from(listDart.map((map) =>
        PagamentosPessoa(
            idpagamento: map['idpagamento'],
            datapagamento: map['datapagamento'],
            valorpago: map['valorpago'],
            juros: map['juros'],
            desconto: map['desconto'],
            idcontrato: map['idcontrato'],
            idpessoa: map['idpessoa'],
            nome: map['nome'],
            telefone: map['telefone'],
            proprietario: map['proprietario'],
            cadastradoem: map['cadastradoem'],
            status: map['status'],
            urlAvatar: map['url_avatar'],
            email: map['email'],
            idlocatario: map['idlocatario'])));
//
    return listaPagtosPessoa;
  }
}
