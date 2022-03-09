import 'package:flutter/material.dart';
import '../../src/api/bens/imovel_api.dart';
import '../../src/states/imovel_state.dart';

class ImovelStore extends ValueNotifier<ImovelState> {
  final ImovelApi srvImovel;
  //ImovelStore(List<Imovel> value) : super(value);
  ImovelStore(this.srvImovel) : super(InitialImovelState());
  Future fetchImovel() async {
    value = LoadingImovelState();
    try {
      final imovels = await srvImovel.fetchImovel();
      value = SucessImovelState(imovels);
    } catch (e) {
      value = ErrorImovelState(e.toString());
    }
  }
}
