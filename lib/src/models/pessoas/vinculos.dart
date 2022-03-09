import 'dart:convert';

class Vinculos {
  int idvinculo;
  int idnaturezarelac;
  int idpessoa;
  String inicio;
  String fim;
  int idimovel;

  Vinculos(
      {this.idvinculo,
      this.idnaturezarelac,
      this.idpessoa,
      this.inicio,
      this.fim,
      this.idimovel});
  Map<String, dynamic> toMap() {
    return {
      'idvinculo': idvinculo,
      'idnaturezarelac': idnaturezarelac,
      'idpessoa': idpessoa,
      'inicio': inicio,
      'fim': fim,
      'idimovel': idimovel,
    };
  }

  factory Vinculos.fromMap(Map<String, dynamic> map) {
    return Vinculos(
      idvinculo: map['idvinculo'],
      idnaturezarelac: map['idnaturezarelac'],
      idpessoa: map['idpessoa'],
      inicio: map['inicio'],
      fim: map['fim'],
      idimovel: map['idimovel'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Vinculos.fromJson(String source) =>
      Vinculos.fromMap(json.decode(source));
  @override
  String toString() {
    return 'Vinculos(idvinculo:$idvinculo,idnaturezarelac:$idnaturezarelac,idpessoa:$idpessoa,inicio:$inicio,fim:$fim,idimovel:$idimovel)';
  }
}
