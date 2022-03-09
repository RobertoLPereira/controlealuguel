import '../../src/models/pessoas/pessoas.dart';

abstract class PessoaState {}

//inicial,Sucesso,Erro, Processando
class InitialPessoaState extends PessoaState {}

class SucessPessoaState extends PessoaState {
  final List<Pessoas> pessoas;
  SucessPessoaState(this.pessoas);
}

class ErrorPessoaState extends PessoaState {
  final String message;
  ErrorPessoaState(this.message);
}

class LoadingPessoaState extends PessoaState {}
