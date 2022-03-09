import '../../../src/api/contrato/contrato_api.dart';

import '../../../src/states/contrato_state.dart';
import 'package:flutter/material.dart';

class ContratoStore extends ValueNotifier<ContratoState> {
  final ContratoApi srvContrato;
  //ContratoStore(List<Contrato> value) : super(value);
  ContratoStore(this.srvContrato) : super(InitialContratoState());
  Future fetchContrato() async {
    value = LoadingContratoState();
    try {
      final contratos = await srvContrato.fetchContrato();
      value = SucessContratoState(contratos);
    } catch (e) {
      value = ErrorContratoState(e.toString());
    }
  }
}
