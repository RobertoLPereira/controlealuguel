import 'package:controlealuguel/app/domain/services/leituraaguaunidade_service.dart';
import 'package:controlealuguel/src/models/bens/leituraaguaunidade.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:get_it/get_it.dart';

import '../../../nomedasrotas.dart';
part 'leituraaguaunidade_list_back.g.dart';

class LeituraaguaunidadeListBack = _LeituraaguaunidadeListBack
    with _$LeituraaguaunidadeListBack;

abstract class _LeituraaguaunidadeListBack with Store {
  var _service = GetIt.I.get<LeituraaguaunidadeService>();

  //lista de leituraaguaunidades
  @observable
  Future<List<LeituraAguaUnidade>> list;

  //metodo para atualizar a lista de leituraaguaunidades
  @action
  refreshList([dynamic value]) {
    list = _service.find();
  }

  _LeituraaguaunidadeListBack() {
    refreshList();
  }

  //metodo para chamar o form salvar/alterar
  goToForm(BuildContext context, [LeituraAguaUnidade leituraaguaunidade]) {
    Navigator.of(context)
        .pushNamed(NomedasRotas.LEITURAAGUAUNIDADE_FORM,
            arguments: leituraaguaunidade)
        .then(refreshList);
  }

  goToDetails(BuildContext context, LeituraAguaUnidade leituraaguaunidade) {
    Navigator.of(context).pushNamed(NomedasRotas.LEITURAAGUAUNIDADE_DETAILS,
        arguments: leituraaguaunidade);
  }

  //excluir
  remove(int id) {
    _service.remove(id);
    refreshList();
  }
}
