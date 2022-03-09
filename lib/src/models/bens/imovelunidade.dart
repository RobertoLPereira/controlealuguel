import 'dart:convert';

class Imovelunidade {
  int idunidade;
  int idimovel;
  int idlocatario;
  String descricao;
  int status;
  int idimovelcategoria;

  Imovelunidade(
      {this.idunidade,
      this.idimovel,
      this.idlocatario,
      this.descricao,
      this.status,
      this.idimovelcategoria});
  Map<String, dynamic> toMap() {
    return {
      'idunidade': idunidade,
      'idimovel': idimovel,
      'idlocatario': idlocatario,
      'descricao': descricao,
      'status': status,
      'idimovelcategoria': idimovelcategoria,
    };
  }

  factory Imovelunidade.fromMap(Map<String, dynamic> map) {
    return Imovelunidade(
      idunidade: map['idunidade'],
      idimovel: map['idimovel'],
      idlocatario: map['idlocatario'],
      descricao: map['descricao'],
      status: map['status'],
      idimovelcategoria: map['idimovelcategoria'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Imovelunidade.fromJson(String source) =>
      Imovelunidade.fromMap(json.decode(source));
  @override
  String toString() {
    return 'Imovelunidade(idunidade:$idunidade,idimovel:$idimovel,idlocatario:$idlocatario,descricao:$descricao,status:$status,idimovelcategoria:$idimovelcategoria)';
  }
}
