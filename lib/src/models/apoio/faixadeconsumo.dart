import 'dart:convert';

class Faixadeconsumo {
  String idfaixadeconsumo;
  String denominacao;
  String faixainicial;
  String faixafinal;
  double tarifaagua;
  double tarifaesgoto;
  double tfdi;
  String idimovel;

  Faixadeconsumo(
      {this.idfaixadeconsumo,
      this.denominacao,
      this.faixainicial,
      this.faixafinal,
      this.tarifaagua,
      this.tarifaesgoto,
      this.tfdi,
      this.idimovel});
  Map<String, dynamic> toMap() {
    return {
      'idfaixadeconsumo': idfaixadeconsumo,
      'denominacao': denominacao,
      'faixainicial': faixainicial,
      'faixafinal': faixafinal,
      'tarifaagua': tarifaagua,
      'tarifaesgoto': tarifaesgoto,
      'tfdi': tfdi,
      'idimovel': idimovel,
    };
  }

  factory Faixadeconsumo.fromMap(Map<String, dynamic> map) {
    return Faixadeconsumo(
      idfaixadeconsumo: map['idfaixadeconsumo'],
      denominacao: map['denominacao'],
      faixainicial: map['faixainicial'],
      faixafinal: map['faixafinal'],
      tarifaagua: map['tarifaagua'],
      tarifaesgoto: map['tarifaesgoto'],
      tfdi: map['tfdi'],
      idimovel: map['idimovel'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Faixadeconsumo.fromJson(String source) =>
      Faixadeconsumo.fromMap(json.decode(source));
  @override
  String toString() {
    return 'Faixadeconsumo(idfaixadeconsumo:$idfaixadeconsumo,denominacao:$denominacao,faixainicial:$faixainicial,faixafinal:$faixafinal,tarifaagua:$tarifaagua,tarifaesgoto:$tarifaesgoto,tfdi:$tfdi,idimovel:$idimovel)';
  }
}
