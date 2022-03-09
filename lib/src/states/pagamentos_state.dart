import 'package:controlealuguel/src/models/pagamento/unidade_pagamento.dart';

import '../../src/models/pagamento/pagamentos.dart';

abstract class PagamentosState {}

//inicial,Sucesso,Erro, Processando
class InitialPagamentosState extends PagamentosState {}

class SucessPagamentosState extends PagamentosState {
  final List<Pagamentos> pagamentos;
  SucessPagamentosState(this.pagamentos);
}

class SucessPagtoState extends PagamentosState {
  final List<UnidadePagto> pagto;
  SucessPagtoState(this.pagto);
}

class ErrorPagtoState extends PagamentosState {
  final String message;
  ErrorPagtoState(this.message);
}

class ErrorPagamentosState extends PagamentosState {
  final String message;
  ErrorPagamentosState(this.message);
}

class LoadingPagamentosState extends PagamentosState {}
