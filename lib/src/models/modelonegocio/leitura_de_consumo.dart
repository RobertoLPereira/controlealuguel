import 'dart:convert';

//Representa os dados necessários para cadastrar a leitura de consumo:
// de água e luz
class LeituraDeConsumo {
  int idleituraaguaunidade;
  int idunidadeimovel;
  double leituraanterior;
  double leituraatual;
  int codigomedidoragua;
  int codigomedidorluz;
  DateTime dataleituraagua;
  DateTime dataleituraluz;
  double valor;
  int status;
  //get e set
  int get getIdunidadeimovel => this.idunidadeimovel;

  set setIdunidadeimovel(int idunidadeimovel) =>
      this.idunidadeimovel = idunidadeimovel;

  get getLeituraanterior => this.leituraanterior;

  set setLeituraanterior(leituraanterior) =>
      this.leituraanterior = leituraanterior;

  get getLeituraatual => this.leituraatual;

  set setLeituraatual(leituraatual) => this.leituraatual = leituraatual;

  get getCodigomedidoragua => this.codigomedidoragua;

  set setCodigomedidoragua(codigomedidoragua) =>
      this.codigomedidoragua = codigomedidoragua;

  get getCodigomedidorluz => this.codigomedidorluz;

  set setCodigomedidorluz(codigomedidorluz) =>
      this.codigomedidorluz = codigomedidorluz;

  get getDataleituraagua => this.dataleituraagua;

  set setDataleituraagua(dataleituraagua) =>
      this.dataleituraagua = dataleituraagua;

  get getDataleituraluz => this.dataleituraluz;

  set setDataleituraluz(dataleituraluz) => this.dataleituraluz = dataleituraluz;

  get getValor => this.valor;

  set setValor(valor) => this.valor = valor;

  get getStatus => this.status;

  set setStatus(status) => this.status = status;
  LeituraDeConsumo({
    this.idleituraaguaunidade,
    this.idunidadeimovel,
    this.leituraanterior,
    this.leituraatual,
    this.codigomedidoragua,
    this.codigomedidorluz,
    this.dataleituraagua,
    this.dataleituraluz,
    this.valor,
    this.status,
  });
  //get e set

  Map<String, dynamic> toMap() {
    return {
      'idleituraaguaunidade': idleituraaguaunidade,
      'idunidadeimovel': idunidadeimovel,
      'leituraanterior': leituraanterior,
      'leituraatual': leituraatual,
      'codigomedidoragua': codigomedidoragua,
      'codigomedidorluz': codigomedidorluz,
      'dataleituraagua': dataleituraagua.millisecondsSinceEpoch,
      'dataleituraluz': dataleituraluz.millisecondsSinceEpoch,
      'valor': valor,
      'status': status,
    };
  }

  factory LeituraDeConsumo.fromMap(Map<String, dynamic> map) {
    return LeituraDeConsumo(
      idleituraaguaunidade: map['idleituraaguaunidade']?.toInt() ?? 0,
      idunidadeimovel: map['idunidadeimovel']?.toInt() ?? 0,
      leituraanterior: map['leituraanterior']?.toDouble() ?? 0.0,
      leituraatual: map['leituraatual']?.toDouble() ?? 0.0,
      codigomedidoragua: map['codigomedidoragua']?.toInt() ?? 0,
      codigomedidorluz: map['codigomedidorluz']?.toInt() ?? 0,
      dataleituraagua:
          DateTime.fromMillisecondsSinceEpoch(map['dataleituraagua']),
      dataleituraluz:
          DateTime.fromMillisecondsSinceEpoch(map['dataleituraluz']),
      valor: map['valor']?.toDouble() ?? 0.0,
      status: map['status']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory LeituraDeConsumo.fromJson(String source) =>
      LeituraDeConsumo.fromMap(json.decode(source));

  @override
  String toString() {
    return 'LeituraDeConsumo(idleituraaguaunidade:$idleituraaguaunidade,idunidadeimovel: $idunidadeimovel, leituraanterior: $leituraanterior, leituraatual: $leituraatual, codigomedidoragua: $codigomedidoragua, codigomedidorluz: $codigomedidorluz, dataleituraagua: $dataleituraagua, dataleituraluz: $dataleituraluz, valor: $valor, status: $status, this.idunidadeimovel: $this.idunidadeimovel, this.leituraanterior: $this.leituraanterior, this.codigomedidoragua: $this.codigomedidoragua, this.codigomedidorluz: $this.codigomedidorluz, this.dataleituraagua: $this.dataleituraagua)';
  }
}
