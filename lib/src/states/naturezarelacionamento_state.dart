import '../../src/models/apoio/naturezarelacionamentos.dart';

abstract class NaturezarelacionamentoState {}

//inicial,Sucesso,Erro, Processando
class InitialNaturezarelacionamentoState extends NaturezarelacionamentoState {}

class SucessNaturezarelacionamentoState extends NaturezarelacionamentoState {
  final List<Naturezarelacionamento> naturezarelacionamento;
  SucessNaturezarelacionamentoState(this.naturezarelacionamento);
}

class ErrorNaturezarelacionamentoState extends NaturezarelacionamentoState {
  final String message;
  ErrorNaturezarelacionamentoState(this.message);
}

class LoadingNaturezarelacionamentoState extends NaturezarelacionamentoState {}
