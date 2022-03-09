import '../../../src/models/pessoas/contact.dart';

abstract class ContactState {}

//inicial,Sucesso,Erro, Processando
class InitialContactState extends ContactState {}

class SucessContactState extends ContactState {
  final List<Contact> pessoas;
  SucessContactState(this.pessoas);
}

class ErrorContactState extends ContactState {
  final String message;
  ErrorContactState(this.message);
}

class LoadingContactState extends ContactState {}
