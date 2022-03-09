import 'package:controlealuguel/src/models/pagamento/unidade_pagamento.dart';
import 'package:controlealuguel/src/utils/consultas_genericas.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class PagamentoService {
  Future<List<UnidadePagto>> findImovel(dynamic id) async {
    var condicao =
        vw_unidadepagadora + ' where un.idlocatario=' + id.toString();
    var uri = Uri.parse('https://apialugueis.herokuapp.com/Contact/$condicao');
    var resposta = await http.get(uri);
    if (resposta.statusCode != 200) throw Exception('Erro REST API.');
    //print(resposta.body);
    Iterable listDart = json.decode(resposta.body);
    //print(listDart);
    var listUnidadePagto = List<UnidadePagto>.from(listDart.map((map) =>
        UnidadePagto(
            idcontrato: map['idcontrato'],
            idunidadeimovel: map['idunidadeimovel'],
            idlocador: map['idlocador'],
            idlocatario: map['idlocatario'],
            diavencimento: map['diavencimento'],
            datacontrato: map['datacontrato'],
            status: map['status'],
            validadecontrato: map['validadecontrato'],
            valor: map['valor'],
            taxacondominio: map['taxacondominio'],
            valordecaucao: map['valordecaucao'],
            idunidade: map['idunidade'],
            idimovel: map['idimovel'],
            descricao: map['descricao'],
            idimovelcategoria: map['idimovelcategoria'],
            endereco: map['endereco'],
            idproprietario: map['idproprietario'])));
    return listUnidadePagto;
  }
}
