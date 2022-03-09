import '../../src/models/bens/leituraaguaunidade.dart';

abstract class LeituraaguaunidadeState {}

//inicial,Sucesso,Erro, Processando
class InitialLeituraaguaunidadeState extends LeituraaguaunidadeState {}

class SucessLeituraaguaunidadeState extends LeituraaguaunidadeState {
  final List<LeituraAguaUnidade> leituraaguaunidade;
  SucessLeituraaguaunidadeState(this.leituraaguaunidade);
}

class ErrorLeituraaguaunidadeState extends LeituraaguaunidadeState {
  final String message;
  ErrorLeituraaguaunidadeState(this.message);
}

class LoadingLeituraaguaunidadeState extends LeituraaguaunidadeState {}
