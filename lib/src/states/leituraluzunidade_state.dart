import '../../src/models/bens/leituraluzunidade.dart';

abstract class LeituraluzunidadeState {}

//inicial,Sucesso,Erro, Processando
class InitialLeituraluzunidadeState extends LeituraluzunidadeState {}

class SucessLeituraluzunidadeState extends LeituraluzunidadeState {
  final List<Leituraluzunidade> leituraluzunidade;
  SucessLeituraluzunidadeState(this.leituraluzunidade);
}

class ErrorLeituraluzunidadeState extends LeituraluzunidadeState {
  final String message;
  ErrorLeituraluzunidadeState(this.message);
}

class LoadingLeituraluzunidadeState extends LeituraluzunidadeState {}
