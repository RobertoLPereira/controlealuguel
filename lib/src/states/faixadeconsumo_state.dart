import '../../src/models/apoio/faixadeconsumo.dart';

abstract class FaixadeconsumoState {}

//inicial,Sucesso,Erro, Processando
class InitialFaixadeconsumoState extends FaixadeconsumoState {}

class SucessFaixadeconsumoState extends FaixadeconsumoState {
  final List<Faixadeconsumo> faixadeconsumo;
  SucessFaixadeconsumoState(this.faixadeconsumo);
}

class ErrorFaixadeconsumoState extends FaixadeconsumoState {
  final String message;
  ErrorFaixadeconsumoState(this.message);
}

class LoadingFaixadeconsumoState extends FaixadeconsumoState {}
