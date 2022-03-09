import 'dart:convert';

class Imovel {
  dynamic idimovel;
  String descricao;
  String endereco;
  dynamic idproprietario;
  dynamic status;
  dynamic idimovelcategoria;

  Imovel(
      {this.idimovel,
      this.descricao,
      this.endereco,
      this.idproprietario,
      this.status,
      this.idimovelcategoria});
  Map<String, dynamic> toMap() {
    return {
      'idimovel': idimovel,
      'descricao': descricao,
      'endereco': endereco,
      'idproprietario': idproprietario,
      'status': status,
      'idimovelcategoria': idimovelcategoria,
    };
  }

  factory Imovel.fromMap(Map<String, dynamic> map) {
    return Imovel(
      idimovel: map['idimovel'],
      descricao: map['descricao'],
      endereco: map['endereco'],
      idproprietario: map['idproprietario'],
      status: map['status'],
      idimovelcategoria: map['idimovelcategoria'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Imovel.fromJson(String source) => Imovel.fromMap(json.decode(source));
  @override
  String toString() {
    return 'Imovel(idimovel:$idimovel,descricao:$descricao,endereco:$endereco,idproprietario:$idproprietario,status:$status,idimovelcategoria:$idimovelcategoria,)';
  }
}
