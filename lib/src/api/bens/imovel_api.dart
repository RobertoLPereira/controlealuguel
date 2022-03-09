import 'dart:convert';
import 'package:controlealuguel/src/models/bens/imovelWrap.dart';
import 'package:controlealuguel/src/models/bens/imovelunidade.dart';
import 'package:controlealuguel/src/models/interfaces/bens/imovel_interface.dart';
import 'package:controlealuguel/src/models/pessoas/pessoas.dart';
import 'package:controlealuguel/src/utils/consultas_genericas.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import '../../../src/models/bens/imovel.dart';
import 'package:uno/uno.dart';

class ImovelApi implements ImovelDAO {
  final uriREST = Uri.parse('https://apialugueis.herokuapp.com/Imovel');

  @override
  Future<List<ImovelWrap>> find() async {
    //print('vou buscar lista de imoveis');
    var uri = Uri.parse(
        'https://apialugueis.herokuapp.com/Consultar/$vw_imoveilWrap');
    var resposta = await http.get(uri);
    if (resposta.statusCode != 200) throw Exception('Erro REST API. Imovel ');
    Iterable listDart = json.decode(resposta.body);
    var listImovel = List<ImovelWrap>.from(listDart.map((map) => ImovelWrap(
          idimovel: map['idimovel'],
          descricao: map['descricao'],
          endereco: map['endereco'],
          idproprietario: map['idproprietario'],
          status: map['status'],
          idimovelcategoria: map['idimovelcategoria'],
          idpessoa: map['idpessoa'],
          nome: map['nome'],
          telefone: map['telefone'],
          proprietario: map['proprietario'],
          cadastradoem: map['cadastradoem'],
          urlAvatar: map['url_avatar'],
          email: map['email'],
          categoria: map['categoria'],
        )));
    return listImovel;
  }

  final Uno uno;

  ImovelApi(this.uno);
  Future<List<Imovel>> fetchImovel() async {
    final response = await uno.get('https://apialugueis.herokuapp.com/Imovel');
    final lista = response.data as List;
    final listaImovel = lista.map((e) => Imovel.fromMap(e)).toList();
    return listaImovel;
  }

  @override
  Future<List<Pessoas>> getPessoasByProprietario(int idproprietario) async {
    var jsonFile = await rootBundle.loadString('assets/pessoas.json');
    List<dynamic> pessoas = json.decode(jsonFile) as List;
    return pessoas
        .map((c) => Pessoas.fromMap(c))
        .where((c) => c.idpessoa == idproprietario)
        .toList();
  }

  @override
  Future<dynamic> save(ImovelWrap imovel) async {
    var resposta;
    var headers = {'Content-Type': 'application/json'};
    var imovelJson = jsonEncode({
      'idimovel': imovel.idimovel,
      'descricao': imovel.descricao,
      'endereco': imovel.endereco,
      'idproprietario': imovel.idproprietario,
      'status': imovel.status,
      'idimovelcategoria': imovel.idimovelcategoria,
    });
    //print(imovelJson);
    int statusCode = 0;
    if (imovel.idimovel == null) {
      resposta = await http.post(uriREST, headers: headers, body: imovelJson);
      statusCode = resposta.statusCode;
    } else {
      resposta = await http.put(uriREST, headers: headers, body: imovelJson);
      statusCode = resposta.statusCode;
    }
    if (statusCode != 200 && statusCode != 204)
      throw Exception('Erro REST API Salvar Imovel.');
    return resposta;
  }

  @override
  Future<List<Imovelunidade>> listar(idimovel) async {
    final response = await uno
        .get('https://apialugueis.herokuapp.com/Unidadeimovel/$idimovel');
    final lista = response.data as List;
    final listaImovel = lista.map((e) => Imovelunidade.fromMap(e)).toList();
    return listaImovel;
  }

  @override
  remove(id) async {
    var uri =
        Uri.parse('https://apialugueis.herokuapp.com/DesativarImovel/$id');
    var resposta = await http.put(uri);
    if (resposta.statusCode != 200)
      throw Exception('Erro REST API Desativar. $resposta.statusCode');
  }

  @override
  reativar(id) async {
    var uri = Uri.parse('https://apialugueis.herokuapp.com/AtivarImovel/$id');
    var resposta = await http.put(uri);
    if (resposta.statusCode != 200)
      throw Exception('Erro REST API Reativa. $resposta.statusCode');
  }

  @override
  Future<List<Pessoas>> getProrietarios() async {
    var jsonFile = await rootBundle.loadString('assets/proprietarios.json');
    List<dynamic> pessoas = json.decode(jsonFile) as List;
    return pessoas.map((c) => Pessoas.fromMap(c)).toList();
  }

  @override
  salvar(Imovel imovel) async {
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
