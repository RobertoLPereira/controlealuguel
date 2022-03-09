import 'package:controlealuguel/nomedasrotas.dart';
import '../../../domain/entities/status.dart';
import '../../../../app/domain/services/status_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'status_list_back.g.dart';

class StatusListBack = _StatusListBack with _$StatusListBack;

abstract class _StatusListBack with Store {
  var _service = GetIt.I.get<StatusService>();

  //lista de contatos
  @observable
  Future<List<Status>> list;

  //método para atualizar a lista de contatos
  @action
  refreshList([dynamic value]) {
    list = _service.find();
  }

  _StatusListBack() {
    refreshList();
  }

  //método para chamar o form salvar/alterar
  goToForm(BuildContext context, [Status status]) {
    Navigator.of(context)
        .pushNamed(NomedasRotas.STATUSFORM, arguments: status)
        .then(refreshList);
  }

  goToDetails(BuildContext context, Status status) {
    Navigator.of(context).pushNamed(NomedasRotas.STATUSDET, arguments: status);
  }

  //excluir
  remove(dynamic id, BuildContext context) async {
    await _service.remove(id);
    refreshList();
    Navigator.of(context).pop();
  }
}
