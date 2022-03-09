import 'package:flutter/material.dart';
import '../../src/api/contrato/pagamentos_api.dart';
import '../../src/states/pagamentos_state.dart';

class PagamentosStore extends ValueNotifier<PagamentosState> {
  final PagamentosApi srvPagamentos;
  //PagamentosStore(List<Pagamentos> value) : super(value);
  PagamentosStore(this.srvPagamentos) : super(InitialPagamentosState());
  Future fetchPagamentos() async {
    value = LoadingPagamentosState();
    try {
      final pagamentoss = await srvPagamentos.fetchPagamentos();
      value = SucessPagamentosState(pagamentoss);
    } catch (e) {
      value = ErrorPagamentosState(e.toString());
    }
  }
}
