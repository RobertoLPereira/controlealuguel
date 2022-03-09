import '../../src/models/pessoas/vinculos.dart';

abstract class VinculosState {}

//inicial,Sucesso,Erro, Processando
class InitialVinculosState extends VinculosState {}

class SucessVinculosState extends VinculosState {
  final List<Vinculos> vinculos;
  SucessVinculosState(this.vinculos);
}

class ErrorVinculosState extends VinculosState {
  final String message;
  ErrorVinculosState(this.message);
}

class LoadingVinculosState extends VinculosState {}
