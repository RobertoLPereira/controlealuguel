// ignore_for_file: unused_import

import 'package:controlealuguel/app/domain/entities/unidade_imovel.dart';
import 'package:controlealuguel/src/models/bens/imovelunidade.dart';
import 'package:controlealuguel/src/models/bens/leituraaguaunidade.dart';
import 'package:controlealuguel/src/models/interfaces/bens/imovelunidade_interface.dart';

import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';

import '../../../nomedasrotas.dart';

part 'imovelunidade_list_back.g.dart';

class ImovelUnidadeListBack = _ImovelUnidadeListBack
    with _$ImovelUnidadeListBack;

abstract class _ImovelUnidadeListBack with Store {
  var _service = GetIt.I.get<ImovelUnidadeDAO>();

  //lista de contatos
  @observable
  Future<List<UnidadeImovel>> list;

  //método para atualizar a lista de contatos
  @action
  refreshList([dynamic value]) {
    list = _service.find();
  }

  _ImovelUnidadeListBack() {
    refreshList();
  }

  //método para chamar o form salvar/alterar
  goToForm(BuildContext context, [UnidadeImovel unidade]) {
    Navigator.of(context)
        .pushNamed('/Unidade-Form', arguments: unidade)
        .then(refreshList);
  }

  goToDetails(BuildContext context, UnidadeImovel unidade) {
    Navigator.of(context).pushNamed('/Unidade-Detail', arguments: unidade);
  }

  goToListaUnidades(BuildContext context, UnidadeImovel unidade) {
    Navigator.of(context).pushNamed('/Unidades', arguments: unidade);
  }

  goToAlugarUnidades(BuildContext context, UnidadeImovel unidade) {
    Navigator.of(context).pushNamed('/Alugar-Form', arguments: unidade);
  }

  goToManterConsumo(BuildContext context, UnidadeImovel unidade) {
    LeituraAguaUnidade consumo = LeituraAguaUnidade();
    consumo.idunidadeimovel = unidade.idunidade;
    consumo.status = "1";
    consumo.codigomedidor = "1234";
    consumo.leituraanterior = "0.00";
    consumo.leituraatual = "0.00";
    consumo.valor = "0.00";
    Navigator.of(context)
        .pushNamed(NomedasRotas.LEITURAAGUAUNIDADE_FORM, arguments: consumo);
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
