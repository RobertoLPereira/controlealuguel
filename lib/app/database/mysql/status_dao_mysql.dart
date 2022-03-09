import 'dart:convert';
import '../../../app/domain/interfaces/statust_dao.dart';
import '../../domain/entities/status.dart';
import 'package:http/http.dart' as http;

class StatusDAOMySQL implements StatusDAO {
  final uriREST = Uri.parse('https://apialugueis.herokuapp.com/Status');

  @override
  Future<List<Status>> find() async {
    var resposta = await http.get(uriREST);
    if (resposta.statusCode != 200) throw Exception('Erro REST API.');
    //print(resposta.body);
    Iterable listDart = json.decode(resposta.body);
    //print(listDart);
    var listStatus = List<Status>.from(listDart.map((item) =>
        Status(idstatus: item['idstatus'], denominacao: item['denominacao'])));
    //print(listStatus);
    return listStatus;
  }

  @override
  remove(id) async {
    var uri = Uri.parse('https://apialugueis.herokuapp.com/Status/$id');
    var resposta = await http.delete(uri);
    if (resposta.statusCode != 200)
      throw Exception('Erro REST API Remove. $resposta.statusCode');
  }

  @override
  save(Status status) async {
    //print(status);
    var headers = {'Content-Type': 'application/json'};
    var statusJson = jsonEncode(
        {'idstatus': status.idstatus, 'denominacao': status.denominacao});
    //print(status.id);
    int statusCode = 0;

    if (status.idstatus == null) {
      //print(statusJson);
      var resposta =
          await http.post(uriREST, headers: headers, body: statusJson);
      statusCode = resposta.statusCode;
    } else {
      var uri = Uri.parse('https://apialugueis.herokuapp.com/Status');
      //print(uri);
      var resposta = await http.put(uri, headers: headers, body: statusJson);
      statusCode = resposta.statusCode;
      //print('$statusCode');
    }
    if (statusCode != 200 && statusCode != 204)
      throw Exception('Erro REST API Salvar. $statusCode');
  }
}
