import 'package:flutter/material.dart';
import '../../src/api/apoio/faixadeconsumo_api.dart';
import '../../src/states/faixadeconsumo_state.dart';

class FaixadeconsumoStore extends ValueNotifier<FaixadeconsumoState> {
  final FaixadeconsumoApi srvFaixadeconsumo;
  //FaixadeconsumoStore(List<Faixadeconsumo> value) : super(value);
  FaixadeconsumoStore(this.srvFaixadeconsumo)
      : super(InitialFaixadeconsumoState());
  Future fetchFaixadeconsumo() async {
    value = LoadingFaixadeconsumoState();
    try {
      final faixadeconsumos = await srvFaixadeconsumo.fetchFaixadeconsumo();
      value = SucessFaixadeconsumoState(faixadeconsumos);
      // print(faixadeconsumos);
    } catch (e) {
      value = ErrorFaixadeconsumoState(e.toString());
    }
  }
}
