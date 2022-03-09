import 'package:controlealuguel/app/domain/services/faixa_de_consumo_service.dart';
import 'package:controlealuguel/nomedasrotas.dart';
import 'package:controlealuguel/src/models/apoio/faixadeconsumo.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:get_it/get_it.dart';
part 'faixa_de_consumo_lista_back.g.dart';

class FaixaConsumoListBack = _FaixaConsumoListBack with _$FaixaConsumoListBack;

abstract class _FaixaConsumoListBack with Store {
  var _service = GetIt.I.get<FaixadeconsumoService>();

  //lista de categoriadeimoveiss
  @observable
  Future<List<Faixadeconsumo>> list;

  //metodo para atualizar a lista de categoriadeimoveiss
  @action
  refreshList([dynamic value]) {
    list = _service.find();
  }

  _FaixaConsumoListBack() {
    refreshList();
  }

  //método para chamar o form salvar/alterar
  goToForm(BuildContext context, [Faixadeconsumo faixa]) {
    Navigator.of(context)
        .pushNamed(NomedasRotas.FAIXADECONSUMO_FORM, arguments: faixa)
        .then(refreshList);
  }

  goToDetails(BuildContext context, Faixadeconsumo faixa) {
    Navigator.of(context)
        .pushNamed(NomedasRotas.FAIXADECONSUMO_DETAIL, arguments: faixa);
  }

  //excluir
  remove(int id) {
    _service.remove(id);
    refreshList();
  }
}
