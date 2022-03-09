import 'dart:convert';

class Status {
  int idstatus;
  String denominacao;

  Status({this.idstatus, this.denominacao});
  Map<String, dynamic> toMap() {
    return {
      'idstatus': idstatus,
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
  @override
  String toString() {
    return 'Status(idstatus:$idstatus,denominacao:$denominacao)';
  }
}
