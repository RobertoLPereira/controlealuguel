import 'dart:convert';

class Taxaadministracao {
  int id;
  int idfavorecido;
  double taxa;
  double valor;
  int idcontrato;
  int situacao;

  Taxaadministracao(
      {this.id,
      this.idfavorecido,
      this.taxa,
      this.valor,
      this.idcontrato,
      this.situacao});
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'idfavorecido': idfavorecido,
      'taxa': taxa,
      'valor': valor,
      'idcontrato': idcontrato,
      'situacao': situacao,
    };
  }

  factory Taxaadministracao.fromMap(Map<String, dynamic> map) {
    return Taxaadministracao(
      id: map['id'],
      idfavorecido: map['idfavorecido'],
      taxa: map['taxa'],
      valor: map['valor'],
      idcontrato: map['idcontrato'],
      situacao: map['situacao'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Taxaadministracao.fromJson(String source) =>
      Taxaadministracao.fromMap(json.decode(source));
  @override
  String toString() {
    return 'Taxaadministracao(id:$id,idfavorecido:$idfavorecido,taxa:$taxa,valor:$valor,idcontrato:$idcontrato,situacao:$situacao)';
  }
}
