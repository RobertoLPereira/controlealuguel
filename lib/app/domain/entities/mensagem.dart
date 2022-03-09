import 'dart:convert';

class Mensagem {
  String msg;
  Mensagem({
    this.msg,
  });

  Map<String, dynamic> toMap() {
    return {
      'msg': msg,
    };
  }

  factory Mensagem.fromMap(Map<String, dynamic> map) {
    return Mensagem(
      msg: map['msg'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Mensagem.fromJson(String source) =>
      Mensagem.fromMap(json.decode(source));
}
