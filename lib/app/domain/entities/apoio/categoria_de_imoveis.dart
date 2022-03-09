import 'dart:convert';

class Categoriadeimoveis {
  dynamic idcategoriadeimoveis;
  String denominacao;

  Categoriadeimoveis({this.idcategoriadeimoveis, this.denominacao});
  Map<String, dynamic> toMap() {
    return {
      'idcategoriadeimoveis': idcategoriadeimoveis,
      'denominacao': denominacao,
    };
  }

  factory Categoriadeimoveis.fromMap(Map<String, dynamic> map) {
    return Categoriadeimoveis(
      idcategoriadeimoveis: map['idcategoriadeimoveis'],
      denominacao: map['denominacao'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Categoriadeimoveis.fromJson(String source) =>
      Categoriadeimoveis.fromMap(json.decode(source));
  @override
  String toString() {
    return 'Categoriadeimoveis(idcategoriadeimoveis:$idcategoriadeimoveis,denominacao:$denominacao,)';
  }
}
