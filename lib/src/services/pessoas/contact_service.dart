import 'dart:convert';
import 'package:controlealuguel/src/models/pagamento/unidade_pagamento.dart';
import 'package:controlealuguel/src/utils/consultas_genericas.dart';
import 'package:uno/uno.dart';
import '../../../src/models/pessoas/contact.dart';
import '../../../src/models/exceptions/domainlayerexception.dart';
import 'package:http/http.dart' as http;

class ContactService {
  final Uno uno;
  final uriREST = Uri.parse('https://apialugueis.herokuapp.com/Contact');
  ContactService(this.uno);

  Future<List<Contact>> fetchPessoas() async {
    final response = await uno.get('https://apialugueis.herokuapp.com/Contact');
    final lista = response.data as List;
    final listaPessoas = lista.map((e) => Contact.fromMap(e)).toList();
    return listaPessoas;
  }

  Future<List<UnidadePagto>> findImovel(dynamic id) async {
    var condicao =
        vw_unidadepagadora + ' where un.idlocatario=' + id.toString();
    var uri = Uri.parse('https://apialugueis.herokuapp.com/Contact/$condicao');
    var resposta = await http.get(uri);
    if (resposta.statusCode != 200) throw Exception('Erro REST API.');
    //print(resposta.body);
    Iterable listDart = json.decode(resposta.body);
    //print(listDart);
    var listUnidadePagto = List<UnidadePagto>.from(listDart.map((map) =>
        UnidadePagto(
            idcontrato: map['idcontrato'],
            idunidadeimovel: map['idunidadeimovel'],
            idlocador: map['idlocador'],
            idlocatario: map['idlocatario'],
            diavencimento: map['diavencimento'],
            datacontrato: map['datacontrato'],
            status: map['status'],
            validadecontrato: map['validadecontrato'],
            valor: map['valor'],
            taxacondominio: map['taxacondominio'],
            valordecaucao: map['valordecaucao'],
            idunidade: map['idunidade'],
            idimovel: map['idimovel'],
            descricao: map['descricao'],
            idimovelcategoria: map['idimovelcategoria'],
            endereco: map['endereco'],
            idproprietario: map['idproprietario'])));
    return listUnidadePagto;
  }

// nome → seja obrigatório, tenha no mínimo 3 caracteres e no máximo 50
  validateName(String name) {
    var min = 3;
    var max = 50;

    if (name.isEmpty) {
      throw new DomainLayerException('O nome é obrigatório.');
    } else if (name.length < min) {
      throw new DomainLayerException(
          'O nome deve possuir pelo menos $min caracteres.');
    } else if (name.length > max) {
      throw new DomainLayerException(
          'O nome deve possuir no máximo $max caracteres.');
    }
  }

// e-mail → seja obrigatório e tenha @
  validateEmail(String email) {
    if (email.isEmpty) {
      throw new DomainLayerException('O e-mail é obrigatório.');
    } else if (!email.contains('@')) {
      throw new DomainLayerException('O e-mail deve possuir @.');
    }
  }

// telefone → seja obrigatório e tenha o formato (99) 9 9999-9999
  validatePhone(String phone) {
    var format = RegExp(
        r'^\([1-9]{2}\) [9] [6-9]{1}[0-9]{3}\-[0-9]{4}$'); // (99) 9 9999-9999
    if (phone.isEmpty) {
      throw new DomainLayerException('O telefone é obrigatório.');
    } else if (!format.hasMatch(phone)) {
      throw new DomainLayerException(
          'Formato inválido. O formato deve ser (99) 9 9999-9999.');
    }
  }

  Future<List<Contact>> find() async {
    var resposta = await http.get(uriREST);
    if (resposta.statusCode != 200) throw Exception('Erro REST API.');
    //print(resposta.body);
    Iterable listDart = json.decode(resposta.body);
    //print(listDart);
    var listContact = List<Contact>.from(listDart.map((item) => Contact(
        id: item['id'],
        nome: item['nome'],
        telefone: item['telefone'],
        email: item['email'],
        url_avatar: item['url_avatar'],
        proprietario: item['proprietario'],
        cadastradoem: item['cadastradoem'],
        status: item['status'])));
    //print(listContact);
    return listContact;
  }

  remove(id) async {
    var uri = Uri.parse('https://apialugueis.herokuapp.com/Contact/$id');
    var resposta = await http.delete(uri);
    if (resposta.statusCode != 200)
      throw Exception('Erro REST API Remove. $resposta.statusCode');
  }

  save(Contact contact) async {
    //print(contact);
    var headers = {'Content-Type': 'application/json'};
    var contactJson = jsonEncode({
      'id': contact.id,
      'nome': contact.nome,
      'telefone': contact.telefone,
      'email': contact.email,
      'url_avatar': contact.url_avatar,
      'proprietario': contact.proprietario,
      'cadastradoem': contact.cadastradoem,
      'status': contact.status
    });
    //print(contact.id);
    int statusCode = 0;

    if (contact.id == null) {
      //print(contactJson);
      var resposta =
          await http.post(uriREST, headers: headers, body: contactJson);
      statusCode = resposta.statusCode;
    } else {
      var uri = Uri.parse('https://apialugueis.herokuapp.com/Contact');
      //print(uri);
      var resposta = await http.put(uri, headers: headers, body: contactJson);
      statusCode = resposta.statusCode;
    }
    if (statusCode != 200 && statusCode != 204)
      throw Exception('Erro REST API Salvar. $statusCode');
  }
}
