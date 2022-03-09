import 'package:flutter/material.dart';
import '../../src/api/bens/leituraluzunidade_api.dart';
import '../../src/states/leituraluzunidade_state.dart';

class LeituraluzunidadeStore extends ValueNotifier<LeituraluzunidadeState> {
  final LeituraluzunidadeApi srvLeituraluzunidade;
  //LeituraluzunidadeStore(List<Leituraluzunidade> value) : super(value);
  LeituraluzunidadeStore(this.srvLeituraluzunidade)
      : super(InitialLeituraluzunidadeState());
  Future fetchLeituraluzunidade() async {
    value = LoadingLeituraluzunidadeState();
    try {
      final leituraluzunidades =
          await srvLeituraluzunidade.fetchLeituraluzunidade();
      value = SucessLeituraluzunidadeState(leituraluzunidades);
    } catch (e) {
      value = ErrorLeituraluzunidadeState(e.toString());
    }
  }
}
