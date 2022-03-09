import '../../models/bens/leituraaguaunidade.dart';
import '../../../nomedasrotas.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:get_it/get_it.dart';
import 'leitura_de_consumo.dart';
import 'leituradeconsumo_service.dart';
part 'leituradeconsumo_list_back.g.dart';

class LeituraDeConsumoListBack = _LeituraDeConsumoListBack
    with _$LeituraDeConsumoListBack;

abstract class _LeituraDeConsumoListBack with Store {
  var _service = GetIt.I.get<LeituradeConsumoService>();

  //lista de leituraaguaunidades
  @observable
  Future<List<LeituraAguaUnidade>> list;

  //metodo para atualizar a lista de leituraaguaunidades
  @action
  refreshList([dynamic value]) {
    list = _service.find();
  }

  _LeituraDeConsumoListBack() {
    refreshList();
  }

  //m�todo para chamar o form salvar/alterar
  goToForm(BuildContext context, [LeituraDeConsumo leituraaguaunidade]) {
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
