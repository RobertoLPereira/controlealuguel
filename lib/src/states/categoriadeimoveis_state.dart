import 'package:controlealuguel/src/models/apoio/categorias.dart';

abstract class CategoriadeimoveisState {}

//inicial,Sucesso,Erro, Processando
class InitialCategoriadeimoveisState extends CategoriadeimoveisState {}

class SucessCategoriadeimoveisState extends CategoriadeimoveisState {
  final List<Categorias> categoriadeimoveis;
  SucessCategoriadeimoveisState(this.categoriadeimoveis);
}

class ErrorCategoriadeimoveisState extends CategoriadeimoveisState {
  final String message;
  ErrorCategoriadeimoveisState(this.message);
}

class LoadingCategoriadeimoveisState extends CategoriadeimoveisState {}
