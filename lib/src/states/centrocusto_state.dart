import '../../src/models/apoio/centrocusto.dart';

abstract class CentrocustoState {}

//inicial,Sucesso,Erro, Processando
class InitialCentrocustoState extends CentrocustoState {}

class SucessCentrocustoState extends CentrocustoState {
  final List<Centrocusto> centrocusto;
  SucessCentrocustoState(this.centrocusto);
}

class ErrorCentrocustoState extends CentrocustoState {
  final String message;
  ErrorCentrocustoState(this.message);
}

class LoadingCentrocustoState extends CentrocustoState {}
