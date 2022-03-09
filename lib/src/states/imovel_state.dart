import '../../src/models/bens/imovel.dart';

abstract class ImovelState {}

//inicial,Sucesso,Erro, Processando
class InitialImovelState extends ImovelState {}

class SucessImovelState extends ImovelState {
  final List<Imovel> imovel;
  SucessImovelState(this.imovel);
}

class ErrorImovelState extends ImovelState {
  final String message;
  ErrorImovelState(this.message);
}

class LoadingImovelState extends ImovelState {}
