import 'package:controlealuguel/app/domain/services/pessoas_wrap_service.dart';
import 'package:controlealuguel/nomedasrotas.dart';
import 'package:controlealuguel/src/models/bens/imovelWrap.dart';
import 'package:controlealuguel/src/models/pessoas/pessoas_wrap.dart';

import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'pessoas_list_back.g.dart';

class PessoasListBack = _PessoasListBack with _$PessoasListBack;

abstract class _PessoasListBack with Store {
  var _service = GetIt.I.get<PessoasWrapService>();

  //lista de contatos
  @observable
  Future<List<PessoasWrap>> list;

  //método para atualizar a lista de contatos
  @action
  refreshList([dynamic value]) {
    list = _service.find();
  }

  _PessoasListBack() {
    refreshList();
  }

  //método para chamar o form salvar/alterar
  goToForm(BuildContext context, [PessoasWrap pessoasWrap]) {
    Navigator.of(context)
        .pushNamed('/PessoasForm', arguments: pessoasWrap)
        .then(refreshList);
  }

  //método para chamar o form salvar/alterar
  goToFormPagto(BuildContext context, [PessoasWrap pessoasWrap]) {
    Navigator.of(context)
        .pushNamed('/Pagamentos', arguments: pessoasWrap)
        .then(refreshList);
  }

  goToDetails(BuildContext context, PessoasWrap pessoasWrap) {
    Navigator.of(context).pushNamed('/PessoasDetail', arguments: pessoasWrap);
  }

  goToImovel(BuildContext context, PessoasWrap pessoasWrap) {
    ImovelWrap imv = ImovelWrap();
    imv.idproprietario = pessoasWrap.idpessoa;
    imv.idpessoa = pessoasWrap.idpessoa;
    imv.idimovelcategoria = 1;
    imv.status = 1;
    Navigator.of(context).pushNamed(NomedasRotas.IMOVELFORM, arguments: imv);
  }

  goToListaPagamentos(BuildContext context, PessoasWrap pessoasWrap) {
    Navigator.of(context)
        .pushNamed('/PagamentosPessoa', arguments: pessoasWrap);
  }

  remove(dynamic id, BuildContext context) async {
    await _service.remove(id);
    refreshList();
    Navigator.of(context).pop();
  }

  reativar(dynamic id, BuildContext context) async {
    await _service.ativar(id);
    refreshList();
    Navigator.of(context).pop();
  }
}
