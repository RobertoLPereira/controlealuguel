// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

class Contact {
  dynamic id;
  String nome;
  String telefone;
  String email;
  String url_avatar;
  bool proprietario;
  String cadastradoem;
  int status;

  Contact(
      {this.id,
      this.nome,
      this.telefone,
      this.email,
      this.url_avatar,
      this.proprietario,
      this.cadastradoem,
      this.status});
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'telefone': telefone,
      'email': email,
      'url_avatar': url_avatar,
      'proprietario': proprietario,
      'cadastradoem': cadastradoem,
      'status': status,
    };
  }

  factory Contact.fromMap(Map<String, dynamic> map) {
    return Contact(
      id: map['id'],
      nome: map['nome'],
      telefone: map['telefone'],
      email: map['email'],
      url_avatar: map['url_avatar'],
      proprietario: map['proprietario'],
      cadastradoem: map['cadastradoem'],
      status: map['status'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Contact.fromJson(String source) =>
      Contact.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Contact(id: $id, nome: $nome, telefone: $telefone, email: $email, url_avatar: $url_avatar,proprietario: $proprietario,cadastradoem: $cadastradoem, status: $status)';
  }
}
