import 'package:flutter/material.dart';
import '../../src/api/apoio/centrocusto_api.dart';
import '../../src/states/centrocusto_state.dart';

class CentrocustoStore extends ValueNotifier<CentrocustoState> {
  final CentrocustoApi srvCentrocusto;
  //CentrocustoStore(List<Centrocusto> value) : super(value);
  CentrocustoStore(this.srvCentrocusto) : super(InitialCentrocustoState());
  Future fetchCentrocusto() async {
    value = LoadingCentrocustoState();
    try {
      final centrocustos = await srvCentrocusto.fetchCentrocusto();
      value = SucessCentrocustoState(centrocustos);
    } catch (e) {
      value = ErrorCentrocustoState(e.toString());
    }
  }
}
