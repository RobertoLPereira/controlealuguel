import 'package:controlealuguel/src/models/pagamento/unidade_pagamento.dart';

import '../../../../src/models/pagamento/pagamentos.dart';

abstract class PagamentosDAO {
  save(Pagamentos pagamentos);

  remove(dynamic id);

  Future<List<Pagamentos>> find();
  //uso de chamada REST

  Future<List<UnidadePagto>> buscarPagamentos(dynamic id);
}
