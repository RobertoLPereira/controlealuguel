import 'package:controlealuguel/app/domain/services/naturezarelacionamento_service.dart';
import 'package:controlealuguel/nomedasrotas.dart';
import 'package:controlealuguel/src/models/apoio/naturezarelacionamentos.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'natrelac_list_back.g.dart';

class NatRelacListBack = _NatRelacListBack with _$NatRelacListBack;

abstract class _NatRelacListBack with Store {
  var _service = GetIt.I.get<NatRelacService>();

  //lista de contatos
  @observable
  Future<List<Naturezarelacionamento>> list;

  //método para atualizar a lista de contatos
  @action
  refreshList([dynamic value]) {
    list = _service.find();
  }

  _NatRelacListBack() {
    refreshList();
  }

  //método para chamar o form salvar/alterar
  goToForm(BuildContext context, [Naturezarelacionamento natrelac]) {
    Navigator.of(context)
        .pushNamed(NomedasRotas.NATRELACFORM, arguments: natrelac)
        .then(refreshList);
  }

  goToDetails(BuildContext context, Naturezarelacionamento natrelac) {
    Navigator.of(context)
        .pushNamed(NomedasRotas.NATRELACDET, arguments: natrelac);
  }

  //excluir
  remove(dynamic id, BuildContext context) async {
    await _service.remove(id);
    refreshList();
    Navigator.of(context).pop();
  }
}
