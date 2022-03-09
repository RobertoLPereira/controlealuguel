import 'dart:convert';

// ignore: unused_import
import 'package:controlealuguel/app/domain/interfaces/natrelac_dao.dart';
import 'package:controlealuguel/src/models/interfaces/apoio/naturezarelacionamento_interface.dart';
import 'package:http/http.dart' as http;
import '../../../src/models/apoio/naturezarelacionamentos.dart';
import 'package:uno/uno.dart';

class NaturezarelacionamentoApi implements NaturezarelacionamentoDAO {
  final uriREST =
      Uri.parse('https://apialugueis.herokuapp.com/Naturezarelacionamento');
  final Uno uno;

  NaturezarelacionamentoApi(this.uno);

  @override
  Future<List<Naturezarelacionamento>> find() async {
    var resposta = await http.get(uriREST);
    if (resposta.statusCode != 200) throw Exception('Erro REST API.');
    Iterable listDart = json.decode(resposta.body);
    var listNaturezarelacionamento = List<Naturezarelacionamento>.from(
        listDart.map((naturezarelacionamento) => Naturezarelacionamento(
              id: naturezarelacionamento['id'],
              denominacao: naturezarelacionamento['denominacao'],
            )));
    return listNaturezarelacionamento;
  }

  Future<List<Naturezarelacionamento>> fetchNaturezarelacionamento() async {
    final response = await uno
        .get('https://apialugueis.herokuapp.com/Naturezarelacionamento');
    final lista = response.data as List;
    final listaNaturezarelacionamento =
        lista.map((e) => Naturezarelacionamento.fromMap(e)).toList();
    return listaNaturezarelacionamento;
  }

  @override
  remove(id) async {
    var uri = Uri.parse(
        'https://apialugueis.herokuapp.com/naturezarelacionamentoM/$id');
    var resposta = await http.delete(uri);
    if (resposta.statusCode != 200) throw Exception('Erro REST API.');
  }

  @override
  save(Naturezarelacionamento naturezarelacionamento) async {
    //print('Vou salvar Natureza de relacionamento');
    var headers = {'Content-Type': 'application/json'};
    var naturezarelacionamentoJson = jsonEncode({
      'id': naturezarelacionamento.id,
      'denominacao': naturezarelacionamento.denominacao,
    });
    int statusCode = 0;
    if (naturezarelacionamento.id == null) {
      var resposta = await http.post(uriREST,
          headers: headers, body: naturezarelacionamentoJson);
      statusCode = resposta.statusCode;
    } else {
      var uriREST2 = Uri.parse(
          'https://apialugueis.herokuapp.com/naturezarelacionamentoM/' +
              naturezarelacionamento.id.toString());
      var resposta = await http.put(uriREST2,
          headers: headers, body: naturezarelacionamentoJson);
      statusCode = resposta.statusCode;
    }
    if (statusCode != 200 && statusCode != 204)
      throw Exception('Erro REST API Salvar.');
  }
}
