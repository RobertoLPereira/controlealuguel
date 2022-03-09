import '../../src/models/contrato/contrato.dart';

abstract class ContratoState {}

//inicial,Sucesso,Erro, Processando
class InitialContratoState extends ContratoState {}

class SucessContratoState extends ContratoState {
  final List<Contrato> contrato;
  SucessContratoState(this.contrato);
}

class ErrorContratoState extends ContratoState {
  final String message;
  ErrorContratoState(this.message);
}

class LoadingContratoState extends ContratoState {}
