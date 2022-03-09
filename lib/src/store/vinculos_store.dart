import 'package:flutter/material.dart';
import '../../src/api/contrato/vinculos_api.dart';
import '../../src/states/vinculos_state.dart';

class VinculosStore extends ValueNotifier<VinculosState> {
  final VinculosApi srvVinculos;
  //VinculosStore(List<Vinculos> value) : super(value);
  VinculosStore(this.srvVinculos) : super(InitialVinculosState());
  Future fetchVinculos() async {
    value = LoadingVinculosState();
    try {
      final vinculoss = await srvVinculos.fetchVinculos();
      value = SucessVinculosState(vinculoss);
    } catch (e) {
      value = ErrorVinculosState(e.toString());
    }
  }
}
