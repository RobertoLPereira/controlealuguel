import 'package:controlealuguel/app/domain/services/categoriade_imoveis_service.dart';
import 'package:controlealuguel/nomedasrotas.dart';
import 'package:controlealuguel/src/models/apoio/categorias.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:get_it/get_it.dart';
part 'categoria_de_imoveis_back.g.dart';

class CategoriadeimoveisListBack = _CategoriadeimoveisListBack
    with _$CategoriadeimoveisListBack;

abstract class _CategoriadeimoveisListBack with Store {
  var _service = GetIt.I.get<CategoriadeImoveisService>();

  //lista de categoriadeimoveiss
  @observable
  Future<List<Categorias>> list;

  //metodo para atualizar a lista de categoriadeimoveiss
  @action
  refreshList([dynamic value]) {
    list = _service.find();
  }

  _CategoriadeimoveisListBack() {
    refreshList();
  }

  //método para chamar o form salvar/alterar
  goToForm(BuildContext context, [Categorias categoriadeimoveis]) {
    print(categoriadeimoveis);
    Navigator.of(context)
        .pushNamed(NomedasRotas.CATEGFORM, arguments: categoriadeimoveis)
        .then(refreshList);
  }

  goToDetails(BuildContext context, Categorias categoriadeimoveis) {
    Navigator.of(context)
        .pushNamed(NomedasRotas.CATEGDET, arguments: categoriadeimoveis);
  }

  //excluir
  remove(int id) {
    _service.remove(id);
    refreshList();
  }
}
