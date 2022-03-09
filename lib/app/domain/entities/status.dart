import 'dart:convert';

class Status {
  dynamic idstatus;
  String denominacao;

  Status({
    this.idstatus,
    this.denominacao,
  });
  Map<String, dynamic> toMap() {
    return {
      'id': idstatus,
      'denominacao': denominacao,
    };
  }

  factory Status.fromMap(Map<String, dynamic> map) {
    return Status(
      idstatus: map['idstatus'],
      denominacao: map['denominacao'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Status.fromJson(String source) => Status.fromMap(json.decode(source));
}
