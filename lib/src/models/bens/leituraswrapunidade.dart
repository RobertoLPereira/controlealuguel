import 'dart:convert';

class LeituraAguaUnidade {
  int idleituraunidade;
  int idunidadeimovel;
  double agualeituraanterior;
  double agualeituraatual;
  double luzleituraanterior;
  double luzleituraatual;
  int aguacodigomedidor;
  int luzcodigomedidor;
  String dataleitura;
  int status;

  LeituraAguaUnidade(
      {this.idleituraunidade,
      this.idunidadeimovel,
      this.agualeituraanterior,
      this.agualeituraatual,
      this.aguacodigomedidor,
      this.luzleituraanterior,
      this.luzleituraatual,
      this.luzcodigomedidor,
      this.dataleitura,
      this.status});
  Map<String, dynamic> toMap() {
    return {
      'idleituraunidade': idleituraunidade,
      'idunidadeimovel': idunidadeimovel,
      'agualeituraanterior': agualeituraanterior,
      'agualeituraatual': agualeituraatual,
      'aguacodigomedidor': aguacodigomedidor,
      'luzleituraanterior': luzleituraanterior,
      'luzleituraatual': luzleituraatual,
      'luzcodigomedidor': luzcodigomedidor,
      'dataleitura': dataleitura,
      'status': status,
    };
  }

  factory LeituraAguaUnidade.fromMap(Map<String, dynamic> map) {
    return LeituraAguaUnidade(
      idleituraunidade: map['idleituraunidade'],
      idunidadeimovel: map['idunidadeimovel'],
      agualeituraanterior: map['agualeituraanterior'],
      agualeituraatual: map['agualeituraatual'],
      aguacodigomedidor: map['aguacodigomedidor'],
      luzleituraanterior: map['luzleituraanterior'],
      luzleituraatual: map['luzleituraatual'],
      luzcodigomedidor: map['luzcodigomedidor'],
      dataleitura: map['dataleitura'],
      status: map['status'],
    );
  }

  String toJson() => json.encode(toMap());

  factory LeituraAguaUnidade.fromJson(String source) =>
      LeituraAguaUnidade.fromMap(json.decode(source));
  @override
  String toString() {
    return 'LeituraAguaUnidade(idleituraunidade:$idleituraunidade,idunidadeimovel:$idunidadeimovel,leituraanterior:$agualeituraanterior,leituraatual:$agualeituraatual,codigomedidor:$aguacodigomedidor,luzleituraanterior:$luzleituraanterior,luzleituraatual:$luzleituraatual,luzcodigomedidor:$luzcodigomedidor,dataleitura:$dataleitura,status:$status)';
  }
}
