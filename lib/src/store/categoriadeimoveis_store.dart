import 'package:controlealuguel/src/api/apoio/categorias_api.dart';
import '../../src/states/categoriadeimoveis_state.dart';
import 'package:flutter/material.dart';

class CategoriadeimoveisStore extends ValueNotifier<CategoriadeimoveisState> {
  final CategoriasAPI srvCategoriadeimoveis;
  //CategoriadeimoveisStore(List<Categoriadeimoveis> value) : super(value);
  CategoriadeimoveisStore(this.srvCategoriadeimoveis)
      : super(InitialCategoriadeimoveisState());
  Future fetchCategoriadeimoveis() async {
    value = LoadingCategoriadeimoveisState();
    try {
      final categoriadeimoveiss = await srvCategoriadeimoveis.find();
      value = SucessCategoriadeimoveisState(categoriadeimoveiss);
    } catch (e) {
      value = ErrorCategoriadeimoveisState(e.toString());
    }
  }
}
