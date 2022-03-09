import 'package:flutter/material.dart';
import '../../src/api/bens/leituraaguaunidade_api.dart';
import '../../src/states/leituraaguaunidade_state.dart';

class LeituraaguaunidadeStore extends ValueNotifier<LeituraaguaunidadeState> {
  final LeituraaguaunidadeApi srvLeituraaguaunidade;
  //LeituraaguaunidadeStore(List<Leituraaguaunidade> value) : super(value);
  LeituraaguaunidadeStore(this.srvLeituraaguaunidade)
      : super(InitialLeituraaguaunidadeState());
  Future fetchLeituraaguaunidade() async {
    value = LoadingLeituraaguaunidadeState();
    try {
      final leituraaguaunidades =
          await srvLeituraaguaunidade.fetchLeituraaguaunidade();
      value = SucessLeituraaguaunidadeState(leituraaguaunidades);
    } catch (e) {
      value = ErrorLeituraaguaunidadeState(e.toString());
    }
  }
}
