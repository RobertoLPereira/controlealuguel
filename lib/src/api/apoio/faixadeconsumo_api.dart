import 'dart:convert';

import 'package:controlealuguel/app/domain/interfaces/faixadeconsumo_interface.dart';
import 'package:http/http.dart' as http;
import '../../../src/models/apoio/faixadeconsumo.dart';
import 'package:uno/uno.dart';

class FaixadeconsumoApi implements FaixadeconsumoInterface {
  final uriREST = Uri.parse('https://apialugueis.herokuapp.com/Faixadeconsumo');

  @override
  Future<List<Faixadeconsumo>> find() async {
    var resposta = await http.get(uriREST);
    if (resposta.statusCode != 200) throw Exception('Erro REST API.');
    Iterable listDart = json.decode(resposta.body);
    var listFaixadeconsumo = List<Faixadeconsumo>.from(
        listDart.map((faixadeconsumo) => Faixadeconsumo(
              idfaixadeconsumo: faixadeconsumo['idfaixadeconsumo'].toString(),
              denominacao: faixadeconsumo['denominacao'],
              faixainicial: faixadeconsumo['faixainicial'].toString(),
              faixafinal: faixadeconsumo['faixafinal'].toString(),
              tarifaagua: faixadeconsumo['tarifaagua'],
              tarifaesgoto: faixadeconsumo['tarifaesgoto'],
              tfdi: faixadeconsumo['tfdi'],
              idimovel: faixadeconsumo['idimovel'].toString(),
            )));
    return listFaixadeconsumo;
  }

  final Uno uno;

  FaixadeconsumoApi(this.uno);
  Future<List<Faixadeconsumo>> fetchFaixadeconsumo() async {
    final response =
        await uno.get('https://apialugueis.herokuapp.com/Faixadeconsumo');
    final lista = response.data as List;
    final listaFaixadeconsumo =
        lista.map((e) => Faixadeconsumo.fromMap(e)).toList();
    return listaFaixadeconsumo;
  }

  @override
  remove(id) async {
    var uri = Uri.parse('https://apialugueis.herokuapp.com/faixadeconsumo/$id');
    var resposta = await http.delete(uri);
    if (resposta.statusCode != 200) throw Exception('Erro REST API.');
  }

  @override
  save(Faixadeconsumo faixadeconsumo) async {
    print(faixadeconsumo);
    var headers = {'Content-Type': 'application/json'};
    var faixadeconsumoJson = jsonEncode({
      'idfaixadeconsumo': faixadeconsumo.idfaixadeconsumo,
      'denominacao': faixadeconsumo.denominacao,
      'faixainicial': int.parse(faixadeconsumo.faixainicial),
      'faixafinal': int.parse(faixadeconsumo.faixafinal),
      'tarifaagua': faixadeconsumo.tarifaagua,
      'tarifaesgoto': faixadeconsumo.tarifaesgoto,
      'tfdi': faixadeconsumo.tfdi,
      'idimovel': int.parse(faixadeconsumo.idimovel),
    });

    int statusCode = 0;
    if (faixadeconsumo.idfaixadeconsumo == null) {
      var resposta =
          await http.post(uriREST, headers: headers, body: faixadeconsumoJson);
      statusCode = resposta.statusCode;
      print(resposta.body);
    } else {
      var resposta =
          await http.put(uriREST, headers: headers, body: faixadeconsumoJson);
      print(resposta.body);
      statusCode = resposta.statusCode;
    }

    if (statusCode != 200 && statusCode != 204)
      throw Exception('Erro REST API.');
  }

  @override
  Future<List<Faixadeconsumo>> buscarFaixadeconsumo() {
    // ignore: todo
    // TODO: implement buscarFaixadeconsumo
    throw UnimplementedError();
  }
}
