import 'dart:convert';

import 'package:http/http.dart' as http;
import '../../../src/models/apoio/status.dart';
import '../../../src/models/interfaces/apoio/status_interface.dart';
import 'package:uno/uno.dart';

class StatusApi implements StatusDAO {
  final uriREST = Uri.parse('https://apialugueis.herokuapp.com/status');

  @override
  Future<List<Status>> find() async {
    var resposta = await http.get(uriREST);
    if (resposta.statusCode != 200) throw Exception('Erro REST API.');
    Iterable listDart = json.decode(resposta.body);
    var listStatus = List<Status>.from(listDart.map((status) => Status(
          idstatus: status['idstatus'],
          denominacao: status['denominacao'],
        )));
    return listStatus;
  }

  final Uno uno;

  StatusApi(this.uno);
  Future<List<Status>> fetchStatus() async {
    final response = await uno.get('https://apialugueis.herokuapp.com/Status');
    final lista = response.data as List;
    final listaStatus = lista.map((e) => Status.fromMap(e)).toList();
    return listaStatus;
  }

  @override
  remove(id) async {
    var uri = Uri.parse('https://apialugueis.herokuapp.com/status/$id');
    var resposta = await http.delete(uri);
    if (resposta.statusCode != 200) throw Exception('Erro REST API.');
  }

  @override
  save(Status status) async {
    var headers = {'Content-Type': 'application/json'};
    var statusJson = jsonEncode({
      'idstatus': status.idstatus,
      'denominacao': status.denominacao,
    });
    int statusCode = 0;
    if (status.idstatus == null) {
      var resposta =
          await http.post(uriREST, headers: headers, body: statusJson);
      statusCode = resposta.statusCode;
    } else {
      var resposta =
          await http.put(uriREST, headers: headers, body: statusJson);
      statusCode = resposta.statusCode;
    }
    if (statusCode != 200) throw Exception('Erro REST API.');
  }

  @override
  Future<List<Status>> buscarStatus() {
    // ignore: todo
    // TODO: implement buscarStatus
    throw UnimplementedError();
  }
}
