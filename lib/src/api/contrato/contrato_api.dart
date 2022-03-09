import 'dart:convert';

import 'package:http/http.dart' as http;
import '../../../src/models/contrato/contrato.dart';
import '../../../src/models/interfaces/contrato_interface.dart';
import 'package:uno/uno.dart';

class ContratoApi implements ContratoDAO {
  final uriREST = Uri.parse('https://apialugueis.herokuapp.com/contrato');

  @override
  Future<List<Contrato>> find() async {
    var resposta = await http.get(uriREST);
    if (resposta.statusCode != 200) throw Exception('Erro REST API.');
    Iterable listDart = json.decode(resposta.body);
    var listContrato = List<Contrato>.from(listDart.map((contrato) => Contrato(
          idcontrato: contrato['idcontrato'],
          idunidadeimovel: contrato['idunidadeimovel'],
          idlocador: contrato['idlocador'],
          idlocatario: contrato['idlocatario'],
          diavencimento: contrato['diavencimento'],
          datacontrato: contrato['datacontrato'],
          status: contrato['status'],
          validadecontrato: contrato['validadecontrato'],
          valor: contrato['valor'],
          taxacondominio: contrato['taxacondominio'],
          valordecaucao: contrato['valordecaucao'],
        )));
    return listContrato;
  }

  final Uno uno;

  ContratoApi(this.uno);
  Future<List<Contrato>> fetchContrato() async {
    final response =
        await uno.get('https://apialugueis.herokuapp.com/Contrato');
    final lista = response.data as List;
    final listaContrato = lista.map((e) => Contrato.fromMap(e)).toList();
    return listaContrato;
  }

  @override
  remove(id) async {
    var uri = Uri.parse('https://apialugueis.herokuapp.com/contrato/$id');
    var resposta = await http.delete(uri);
    if (resposta.statusCode != 200) throw Exception('Erro REST API.');
  }

  @override
  save(Contrato contrato) async {
    var headers = {'Content-Type': 'application/json'};
    var contratoJson = jsonEncode({
      'idcontrato': contrato.idcontrato,
      'idunidadeimovel': contrato.idunidadeimovel,
      'idlocador': contrato.idlocador,
      'idlocatario': contrato.idlocatario,
      'diavencimento': contrato.diavencimento,
      'datacontrato': contrato.datacontrato,
      'status': contrato.status,
      'validadecontrato': contrato.validadecontrato,
      'valor': contrato.valor,
      'taxacondominio': contrato.taxacondominio,
      'valordecaucao': contrato.valordecaucao,
    });
    int statusCode = 0;
    if (contrato.idcontrato == null) {
      var resposta =
          await http.post(uriREST, headers: headers, body: contratoJson);
      statusCode = resposta.statusCode;
    } else {
      var resposta =
          await http.put(uriREST, headers: headers, body: contratoJson);
      statusCode = resposta.statusCode;
    }
    if (statusCode != 200) throw Exception('Erro REST API.');
  }

  @override
  Future<List<Contrato>> buscarContrato() {
    // ignore: todo
    // TODO: implement buscarContrato
    throw UnimplementedError();
  }
}
