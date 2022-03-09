import 'package:controlealuguel/app/domain/entities/unidade_imovel.dart';
import 'package:controlealuguel/app/domain/regrasdenegocio/services/unidade_imovel_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

class AlugarUnidadeImovelFormBack {
  UnidadeImovel unid;
  var _service = GetIt.I.get<UnidadeImovelService>();

  bool _locatarioIsValid;

  bool get isValid => _locatarioIsValid;
  //Receber os parametros enviados por uma chamada
  AlugarUnidadeImovelFormBack(BuildContext context) {
    var parameter = ModalRoute.of(context).settings.arguments;
    unid = (parameter == null) ? UnidadeImovel() : parameter;
  }
  save(BuildContext context) async {
    unid.status = "3";
    print(unid);
    await _service.salvar(unid);
    Navigator.of(context).pop();
  }

  //Validar os dados do formulário

  String validadeLocatario(String locat) {
    try {
      _service.validarLocatario(locat);
      _locatarioIsValid = true;
      return null;
    } catch (e) {
      _locatarioIsValid = false;
      return e.toString();
    }
  }
}
