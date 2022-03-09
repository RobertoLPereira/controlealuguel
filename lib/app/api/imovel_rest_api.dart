import 'dart:convert';
import '../../app/domain/interfaces/imovel_interface.dart';
import '../../app/domain/entities/imovel.dart';
import 'package:http/http.dart' as http;
import 'package:uno/uno.dart';

import '../../nomedosservidores.dart';

class ImovelRestApi implements ImovelInterface {
  final uriREST = Uri.parse(NomeServidoresApi.Api_Alugueis + 'imovel');

  @override
  Future<List<Imovel>> find() async {
    var resposta = await http.get(uriREST);
    if (resposta.statusCode != 200) throw Exception('Erro REST API.');
    Iterable listDart = json.decode(resposta.body);
    var listImovel = List<Imovel>.from(listDart.map((imovel) => Imovel(
          idimovel: imovel['idimovel'],
          descricao: imovel['descricao'],
          endereco: imovel['endereco'],
          idproprietario: imovel['idproprietario'],
          status: imovel['status'],
          idimovelcategoria: imovel['idimovelcategoria'],
        )));
    return listImovel;
  }

  final Uno uno;

  ImovelRestApi(this.uno);
  Future<List<Imovel>> fetchImovel() async {
    final response = await uno.get(NomeServidoresApi.Api_Alugueis + 'Imovel');
    final lista = response.data as List;
    final listaImovel = lista.map((e) => Imovel.fromMap(e)).toList();
    return listaImovel;
  }

  @override
  remove(id) async {
    var uri = Uri.parse(NomeServidoresApi.Api_Alugueis + 'imovel/$id');
    var resposta = await http.delete(uri);
    if (resposta.statusCode != 200) throw Exception('Erro REST API.');
  }

  @override
  save(Imovel imovel) async {
    var headers = {'Content-Type': 'application/json'};
    var imovelJson = jsonEncode({
      'idimovel': imovel.idimovel,
      'descricao': imovel.descricao,
      'endereco': imovel.endereco,
      'idproprietario': imovel.idproprietario,
      'status': imovel.status,
      'idimovelcategoria': imovel.idimovelcategoria,
    });
    int statusCode = 0;
    if (imovel.idimovel == null) {
      var resposta =
          await http.post(uriREST, headers: headers, body: imovelJson);
      statusCode = resposta.statusCode;
    } else {
      var resposta =
          await http.put(uriREST, headers: headers, body: imovelJson);
      statusCode = resposta.statusCode;
    }
    if (statusCode != 200) throw Exception('Erro REST API.');
  }
}
