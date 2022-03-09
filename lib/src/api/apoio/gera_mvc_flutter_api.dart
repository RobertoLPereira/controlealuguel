import 'package:controlealuguel/src/models/apoio/gera_mvc_flutter.dart';
import 'package:controlealuguel/src/models/interfaces/apoio/geramvcflutter_interface.dart';
import 'package:http/http.dart' as http;

class GeraMvcFlutterAPI implements GeramvcflutterIterface {
  var uriREST = Uri.parse('https://apialugueis.herokuapp.com/Consultar/');

  Future<List<GeraMvcFlutter>> find(String tabela) async {
    uriREST = Uri.parse(
        'https://apialugueis.herokuapp.com/Consultar/select gera_mvc_flutter('
        '$tabela'
        '');
    final response = await http.get(uriREST);
    if (response.statusCode != 200) {
      print(response.statusCode);
    }
    final lista = response.body as List;
    final listaLinhas = lista.map((e) => GeraMvcFlutter.fromMap(e)).toList();
    return listaLinhas;
  }
}
