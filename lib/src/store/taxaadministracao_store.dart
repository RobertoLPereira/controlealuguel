import 'package:flutter/material.dart';
import '../../src/api/apoio/taxaadministracao_api.dart';
import '../../src/states/taxaadministracao_state.dart';

class TaxaadministracaoStore extends ValueNotifier<TaxaadministracaoState> {
  final TaxaadministracaoApi srvTaxaadministracao;
  //TaxaadministracaoStore(List<Taxaadministracao> value) : super(value);
  TaxaadministracaoStore(this.srvTaxaadministracao)
      : super(InitialTaxaadministracaoState());
  Future fetchTaxaadministracao() async {
    value = LoadingTaxaadministracaoState();
    try {
      final taxaadministracaos =
          await srvTaxaadministracao.fetchTaxaadministracao();
      value = SucessTaxaadministracaoState(taxaadministracaos);
    } catch (e) {
      value = ErrorTaxaadministracaoState(e.toString());
    }
  }
}
