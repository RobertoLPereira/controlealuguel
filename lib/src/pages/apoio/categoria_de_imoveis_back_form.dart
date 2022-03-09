import 'package:controlealuguel/app/domain/services/categoriade_imoveis_service.dart';
import 'package:controlealuguel/src/models/apoio/categorias.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

class CategoriadeimoveisFormBack {
  Categorias categoriadeimoveis;
  var _service = GetIt.I.get<CategoriadeImoveisService>();
  bool _idcategoriadeimoveisIsValid;
  bool _denominacaoIsValid;

  bool get isValid => _idcategoriadeimoveisIsValid && _denominacaoIsValid;
  // diferenciar novo com alteração
  CategoriadeimoveisFormBack(BuildContext context) {
    var parameter = ModalRoute.of(context).settings.arguments;
    categoriadeimoveis = (parameter == null) ? Categorias() : parameter;
  }

  //salvar
  save(BuildContext context) async {
    await _service.save(categoriadeimoveis);
    Navigator.of(context).pop();
  }

  //validações

  String validateDenominacao(String denominacao) {
    try {
      _service.validatedenominacao(denominacao);
      _denominacaoIsValid = true;
      return null;
    } catch (e) {
      _denominacaoIsValid = false;
      return e.toString();
    }
  }
}
