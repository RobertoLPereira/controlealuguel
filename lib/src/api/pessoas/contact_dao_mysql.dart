import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../src/models/interfaces/pessoas/contact_dao.dart';
import '../../../src/models/pessoas/contact.dart';

class ContactDAOMySQL implements ContactDAO {
  final uriREST = Uri.parse('https://apialugueis.herokuapp.com/Contact');

  @override
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

  @override
  remove(id) async {
    var uri = Uri.parse('https://apialugueis.herokuapp.com/Contact/$id');
    var resposta = await http.delete(uri);
    if (resposta.statusCode != 200)
      throw Exception('Erro REST API Remove. $resposta.statusCode');
  }

  @override
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
