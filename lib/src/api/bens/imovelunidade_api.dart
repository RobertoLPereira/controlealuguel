import 'dart:convert';

import 'package:controlealuguel/app/domain/entities/unidade_imovel.dart';
import 'package:http/http.dart' as http;
import '../../../src/models/interfaces/bens/imovelunidade_interface.dart';
import 'package:uno/uno.dart';

class ImovelunidadeApi implements ImovelUnidadeDAO {
  final uriREST = Uri.parse('https://apialugueis.herokuapp.com/ImovelUnidades');

  @override
  Future<List<UnidadeImovel>> find() async {
    var resposta = await http.get(uriREST);
    if (resposta.statusCode != 200) throw Exception('Erro REST API.');
    //print(resposta.body);
    Iterable listDart = json.decode(resposta.body);
    var listImovelunidade =
        List<UnidadeImovel>.from(listDart.map((imovelunidade) => UnidadeImovel(
              idunidade: imovelunidade['idunidade'].toString(),
              idimovel: imovelunidade['idimovel'].toString(),
              idlocatario: imovelunidade['idlocatario'].toString(),
              descricao: imovelunidade['descricao'],
              status: imovelunidade['status'].toString(),
              idimovelcategoria: imovelunidade['idimovelcategoria'].toString(),
              nome: imovelunidade['nome'],
              endereco: imovelunidade['endereco'],
            )));
    return listImovelunidade;
  }

  final Uno uno;

  ImovelunidadeApi(this.uno);
  Future<List<UnidadeImovel>> fetchImovelunidade() async {
    final response =
        await uno.get('https://apialugueis.herokuapp.com/ImovelUnidades');
    final lista = response.data as List;
    final listaImovelunidade =
        lista.map((e) => UnidadeImovel.fromMap(e)).toList();
    return listaImovelunidade;
  }

  @override
  remove(id) async {
    var uri =
        Uri.parse('https://apialugueis.herokuapp.com/DesativarUnidade/$id');
    var resposta = await http.delete(uri);
    if (resposta.statusCode != 200) throw Exception('Erro REST API.');
  }

  @override
  save(UnidadeImovel imovelunidade) async {
    print('salvar unidade ');
    print(imovelunidade);
    var headers = {'Content-Type': 'application/json'};
    var imovelunidadeJson;
    if (imovelunidade.idunidade == null) {
      imovelunidadeJson = jsonEncode({
        'idimovel': int.parse(imovelunidade.idimovel),
        'idlocatario': 0,
        'descricao': imovelunidade.descricao,
        'status': 4,
        'idimovelcategoria': int.parse(imovelunidade.idimovelcategoria),
      });
    } else {
      imovelunidadeJson = jsonEncode({
        'idunidade': int.parse(imovelunidade.idunidade),
        'idimovel': int.parse(imovelunidade.idimovel),
        'idlocatario': int.parse(imovelunidade.idlocatario),
        'descricao': imovelunidade.descricao,
        'status': int.parse(imovelunidade.status),
        'idimovelcategoria': int.parse(imovelunidade.idimovelcategoria),
      });
    }
    int statusCode = 0;
    if (imovelunidade.idunidade == null) {
      var resposta =
          await http.post(uriREST, headers: headers, body: imovelunidadeJson);
      statusCode = resposta.statusCode;
    } else {
      var resposta =
          await http.put(uriREST, headers: headers, body: imovelunidadeJson);
      statusCode = resposta.statusCode;
    }
    if (statusCode != 200 && statusCode != 204)
      throw Exception('Erro REST API.');
  }

  @override
  Future<List<UnidadeImovel>> buscarImovelunidade() {
    // ignore: todo
    // TODO: implement buscarImovelunidade
    throw UnimplementedError();
  }

  @override
  reativar(id) async {
    var uri = Uri.parse('https://apialugueis.herokuapp.com/AtivarUnidade/$id');
    var resposta = await http.put(uri);
    if (resposta.statusCode != 200)
      throw Exception('Erro REST API Reativa Unidade. $resposta.statusCode');
  }
}
