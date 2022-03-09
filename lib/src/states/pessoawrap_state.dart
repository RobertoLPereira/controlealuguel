import 'package:controlealuguel/src/models/pessoas/pessoas_wrap.dart';

abstract class PessoaWrapState {}

//inicial,Sucesso,Erro, Processando
class InitialPessoaWrapState extends PessoaWrapState {}

class SucessPessoaWrapState extends PessoaWrapState {
  final List<PessoasWrap> pessoas;
  SucessPessoaWrapState(this.pessoas);
}

class ErrorPessoaWrapState extends PessoaWrapState {
  final String message;
  ErrorPessoaWrapState(this.message);
}

class LoadingPessoaWrapState extends PessoaWrapState {}
