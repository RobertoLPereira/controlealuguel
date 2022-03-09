import '../../../app/domain/services/imovel_service.dart';
import '../../../src/models/bens/imovel.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'dart:async';

part 'imovel_list_back.g.dart';

class ImovelListBack = _ImovelListBack with _$ImovelListBack;

abstract class _ImovelListBack with Store {
  var _service = GetIt.I.get<ImovelService>();

  @observable
  Future<List<Imovel>> list;

  @action
  refreshList([dynamic value]) {
    list = _service.find() as Future<List<Imovel>>;
  }

  _ImovelListBack() {
    refreshList();
  }
  //método para chamar o form salvar/alterar
  goToForm(BuildContext context, [Imovel imovel]) {
    Navigator.of(context)
        .pushNamed('/Imovel-Form', arguments: imovel)
        .then(refreshList);
  }

  goToDetails(BuildContext context, [Imovel imovel]) {
    Navigator.of(context).pushNamed('/Imovel-Detail', arguments: imovel);
  }

  //excluir
  remove(int id) {
    _service.remove(id);
    refreshList();
  }
}
