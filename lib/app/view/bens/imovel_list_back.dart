import 'package:controlealuguel/nomedasrotas.dart';
import 'package:controlealuguel/src/models/bens/imovelWrap.dart';
import 'package:controlealuguel/src/models/interfaces/bens/imovel_interface.dart';

import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'imovel_list_back.g.dart';

class ImovelListBack = _ImovelListBack with _$ImovelListBack;

abstract class _ImovelListBack with Store {
  var _service = GetIt.I.get<ImovelDAO>();

  //lista de contatos
  @observable
  Future<List<ImovelWrap>> list;

  //método para atualizar a lista de contatos
  @action
  refreshList([dynamic value]) {
    list = _service.find();
  }

  _ImovelListBack() {
    refreshList();
  }

  //método para chamar a lista de pessoas para escolher o proprietário do imovél
  //que se pretende cadastrar
  goToForm(BuildContext context, [ImovelWrap imovelWrap]) {
    if (imovelWrap == null) {
      Navigator.of(context).pushNamed(NomedasRotas.PESSOAS);
    } else {
      Navigator.of(context)
          .pushNamed(NomedasRotas.IMOVELFORM, arguments: imovelWrap);
    }
  }

  //método para chamar o form salvar/alterar
  goToFormUnidade(BuildContext context, [ImovelWrap ImovelWrap]) {
    Navigator.of(context)
        .pushNamed(NomedasRotas.UNIDADEFORM, arguments: ImovelWrap)
        .then(refreshList);
  }

  goToDetails(BuildContext context, ImovelWrap ImovelWrap) {
    Navigator.of(context)
        .pushNamed(NomedasRotas.IMOVELDETAIL, arguments: ImovelWrap);
  }

  goToListaUnidades(BuildContext context, ImovelWrap ImovelWrap) {
    Navigator.of(context)
        .pushNamed(NomedasRotas.UNIDADEIMOVEL, arguments: ImovelWrap);
  }

  remove(dynamic id, BuildContext context) async {
    await _service.remove(id);
    refreshList();
    Navigator.of(context).pop();
  }

  reativar(dynamic id, BuildContext context) async {
    await _service.reativar(id);
    refreshList();
    Navigator.of(context).pop();
  }
}
