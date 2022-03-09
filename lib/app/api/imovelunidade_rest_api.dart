import 'dart:convert';
import 'package:controlealuguel/app/domain/interfaces/imovelunidade_interface.dart';
import 'package:controlealuguel/src/models/bens/imovelunidade.dart';
import 'package:http/http.dart' as http;
import 'package:uno/uno.dart';

class ImovelUnidadeRestApi implements ImovelUnidadeInterface {
  final uriREST = Uri.parse('https://apialugueis.herokuapp.com/imovelunidade');

  @override
  Future<List<Imovelunidade>> find() async {
    var resposta = await http.get(uriREST);
    if (resposta.statusCode != 200) throw Exception('Erro REST API.');
    Iterable listDart = json.decode(resposta.body);
    var listImovel =
        List<Imovelunidade>.from(listDart.map((imovel) => Imovelunidade(
              idimovel: imovel['idimovel'],
              descricao: imovel['descricao'],
              idunidade: imovel['idunidade'],
              idlocatario: imovel['idlocatario'],
              status: imovel['status'],
              idimovelcategoria: imovel['idimovelcategoria'],
            )));
    return listImovel;
  }

  final Uno uno;

  ImovelUnidadeRestApi(this.uno);
  Future<List<Imovelunidade>> fetchImovel() async {
    final response = await uno.get('http://10.0.0.106:3050/Imovelunidade');
    final lista = response.data as List;
    final listaImovel = lista.map((e) => Imovelunidade.fromMap(e)).toList();
    return listaImovel;
  }

  @override
  remove(id) async {
    var uri = Uri.parse('https://apialugueis.herokuapp.com/imovelunidade/$id');
    var resposta = await http.delete(uri);
    if (resposta.statusCode != 200)
      throw Exception('Erro REST API Imovel Unidade.');
  }

  @override
  save(Imovelunidade imovelunidade) async {
    var headers = {'Content-Type': 'application/json'};
    var imovelJson = jsonEncode({
      'idimovel': imovelunidade.idimovel,
      'descricao': imovelunidade.descricao,
      'idunidade': imovelunidade.idunidade,
      'idlocatario': imovelunidade.idlocatario,
      'status': imovelunidade.status,
      'idimovelcategoria': imovelunidade.idimovelcategoria,
    });
    int statusCode = 0;
    if (imovelunidade.idunidade == null) {
      var resposta =
          await http.post(uriREST, headers: headers, body: imovelJson);
      statusCode = resposta.statusCode;
    } else {
      var resposta =
          await http.put(uriREST, headers: headers, body: imovelJson);
      statusCode = resposta.statusCode;
    }
    if (statusCode != 200) throw Exception('Erro REST API ImovelUnidade.');
  }
}
