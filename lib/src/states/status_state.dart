import '../../src/models/apoio/status.dart';

abstract class StatusState {}

//inicial,Sucesso,Erro, Processando
class InitialStatusState extends StatusState {}

class SucessStatusState extends StatusState {
  final List<Status> status;
  SucessStatusState(this.status);
}

class ErrorStatusState extends StatusState {
  final String message;
  ErrorStatusState(this.message);
}

class LoadingStatusState extends StatusState {}
