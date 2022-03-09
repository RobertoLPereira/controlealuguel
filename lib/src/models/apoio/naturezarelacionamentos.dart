import 'dart:convert';

class Naturezarelacionamento {
  dynamic id;
  String denominacao;

  Naturezarelacionamento({this.id, this.denominacao});
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'denominacao': denominacao,
    };
  }

  factory Naturezarelacionamento.fromMap(Map<String, dynamic> map) {
    return Naturezarelacionamento(
      id: map['id'],
      denominacao: map['denominacao'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Naturezarelacionamento.fromJson(String source) =>
      Naturezarelacionamento.fromMap(json.decode(source));
  @override
  String toString() {
    return 'Naturezarelacionamento(id:$id,denominacao:$denominacao,)';
  }
}
