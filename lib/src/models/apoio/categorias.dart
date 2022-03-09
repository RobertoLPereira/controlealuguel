import 'dart:convert';

class Categorias {
  int idcategoriadeimoveis;
  String denominacao;

  Categorias({this.idcategoriadeimoveis, this.denominacao});
  Map<String, dynamic> toMap() {
    return {
      'idcategoriadeimoveis': idcategoriadeimoveis,
      'denominacao': denominacao,
    };
  }

  factory Categorias.fromMap(Map<String, dynamic> map) {
    return Categorias(
      idcategoriadeimoveis: map['idcategoriadeimoveis'],
      denominacao: map['denominacao'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Categorias.fromJson(String source) =>
      Categorias.fromMap(json.decode(source));
  /*
  @override
  String toString() {
    return 'Categorias(idcategoriadeimoveis:$idcategoriadeimoveis,denominacao:$denominacao)';
  }*/
}
