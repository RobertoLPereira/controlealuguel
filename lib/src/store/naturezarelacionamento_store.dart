import 'package:flutter/material.dart';
import '../../src/api/apoio/naturezarelacionamento_api.dart';
import '../../src/states/naturezarelacionamento_state.dart';

class NaturezarelacionamentoStore
    extends ValueNotifier<NaturezarelacionamentoState> {
  final NaturezarelacionamentoApi srvNaturezarelacionamento;
  //NaturezarelacionamentoStore(List<Naturezarelacionamento> value) : super(value);
  NaturezarelacionamentoStore(this.srvNaturezarelacionamento)
      : super(InitialNaturezarelacionamentoState());
  Future fetchNaturezarelacionamento() async {
    value = LoadingNaturezarelacionamentoState();
    try {
      final naturezarelacionamentos =
          await srvNaturezarelacionamento.fetchNaturezarelacionamento();
      value = SucessNaturezarelacionamentoState(naturezarelacionamentos);
    } catch (e) {
      value = ErrorNaturezarelacionamentoState(e.toString());
    }
  }
}
