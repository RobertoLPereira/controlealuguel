import 'package:controlealuguel/app/domain/entities/unidade_imovel.dart';
import 'package:controlealuguel/app/domain/regrasdenegocio/services/unidade_imovel_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

class UnidadeImovelFormBack {
  UnidadeImovel unid;
  var _service = GetIt.I.get<UnidadeImovelService>();
  bool _descricaoIsValid;
  bool _categoriaIsValid;
  bool _imovelIsValid;

  bool get isValid => _descricaoIsValid && _imovelIsValid && _categoriaIsValid;
  //Receber os parametros enviados por uma chamada
  UnidadeImovelFormBack(BuildContext context) {
    var parameter = ModalRoute.of(context).settings.arguments;
    unid = (parameter == null) ? UnidadeImovel() : parameter;
  }
  save(BuildContext context) async {
    print(unid);
    await _service.salvar(unid);
    Navigator.of(context).pop();
  }

  saveLoop(BuildContext context) async {
    var desc = unid.descricao.split(" ");
    unid.descricao =
        desc[0] + ' Nº ' + (int.parse(unid.idunidade) + 1).toString();
    unid.idunidade = null;
    print(unid);
    await _service.salvar(unid);
    Navigator.of(context).pop();
  }

  //Validar os dados do formulário
  String validateDescricao(String desc) {
    try {
      _service.validarDescricao(desc);
      _descricaoIsValid = true;
      return null;
    } catch (e) {
      _descricaoIsValid = false;
      return e.toString();
    }
  }

  String validateImovel(String imovel) {
    try {
      _service.validarImovel(imovel);
      _imovelIsValid = true;
      return null;
    } catch (e) {
      _imovelIsValid = false;
      return e.toString();
    }
  }

  String validateCategoria(String categ) {
    try {
      _service.validarImovel(categ);
      _categoriaIsValid = true;
      return null;
    } catch (e) {
      _categoriaIsValid = false;
      return e.toString();
    }
  }
}
