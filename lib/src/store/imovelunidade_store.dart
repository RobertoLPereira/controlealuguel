import 'package:flutter/material.dart';
import '../../src/api/bens/imovelunidade_api.dart';
import '../../src/states/imovelunidade_state.dart';

class ImovelunidadeStore extends ValueNotifier<ImovelunidadeState> {
  final ImovelunidadeApi srvImovelunidade;
  //ImovelunidadeStore(List<Imovelunidade> value) : super(value);
  ImovelunidadeStore(this.srvImovelunidade)
      : super(InitialImovelunidadeState());
  Future fetchImovelunidade() async {
    value = LoadingImovelunidadeState();
    try {
      final unidadeImovel = await srvImovelunidade.fetchImovelunidade();
      value = SucessImovelunidadeState(unidadeImovel);
    } catch (e) {
      value = ErrorImovelunidadeState(e.toString());
    }
  }
}
