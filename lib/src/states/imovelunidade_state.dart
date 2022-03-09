import 'package:controlealuguel/app/domain/entities/unidade_imovel.dart';

abstract class ImovelunidadeState {}

//inicial,Sucesso,Erro, Processando
class InitialImovelunidadeState extends ImovelunidadeState {}

class SucessImovelunidadeState extends ImovelunidadeState {
  final List<UnidadeImovel> imovelunidade;
  SucessImovelunidadeState(this.imovelunidade);
}

class ErrorImovelunidadeState extends ImovelunidadeState {
  final String message;
  ErrorImovelunidadeState(this.message);
}

class LoadingImovelunidadeState extends ImovelunidadeState {}
