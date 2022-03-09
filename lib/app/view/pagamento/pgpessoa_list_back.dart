import 'package:controlealuguel/app/domain/services/pessoas_wrap_service.dart';
import 'package:controlealuguel/src/models/pagamento/pagamentoPessoa.dart';
import 'package:controlealuguel/src/models/pessoas/pessoas_wrap.dart';

import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
part 'pgpessoa_list_back.g.dart';

class PgPessoaListBack = _PgPessoaListBack with _$PgPessoaListBack;

abstract class _PgPessoaListBack with Store {
  PessoasWrap pessoasWrap;
  var _service = GetIt.I.get<PessoasWrapService>();

  //lista de pagamentos da pessoa
  @observable
  Future<List<PagamentosPessoa>> listPg;
  //método para atualizar a lista de contatos
  @action
  refreshList([dynamic value]) {
    listPg = _service.listar(value);
  }

  _PgPessoaListBack(BuildContext context) {
    var parameter = ModalRoute.of(context).settings.arguments;
    pessoasWrap = (parameter == null) ? PessoasWrap() : parameter;
    refreshList(pessoasWrap.idpessoa);
  }
}
