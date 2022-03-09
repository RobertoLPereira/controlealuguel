import '../../src/models/apoio/taxaadministracao.dart';

abstract class TaxaadministracaoState {}

//inicial,Sucesso,Erro, Processando
class InitialTaxaadministracaoState extends TaxaadministracaoState {}

class SucessTaxaadministracaoState extends TaxaadministracaoState {
  final List<Taxaadministracao> taxaadministracao;
  SucessTaxaadministracaoState(this.taxaadministracao);
}

class ErrorTaxaadministracaoState extends TaxaadministracaoState {
  final String message;
  ErrorTaxaadministracaoState(this.message);
}

class LoadingTaxaadministracaoState extends TaxaadministracaoState {}
