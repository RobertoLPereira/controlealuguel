import 'package:controlealuguel/app/domain/services/categoriade_imoveis_service.dart';
import 'package:controlealuguel/src/models/apoio/categorias.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

class CategoriaFormBack {
  Categorias categorias;
  var _service = GetIt.I.get<CategoriadeImoveisService>();
  bool _nameIsValid;

  bool get isValid => _nameIsValid;

  // diferenciar novo com alteração
  CategoriaFormBack(BuildContext context) {
    var parameter = ModalRoute.of(context).settings.arguments;
    categorias = (parameter == null) ? Categorias() : parameter;
  }

  //salvar
  save(BuildContext context) async {
    print(categorias);
    await _service.save(categorias);
    Navigator.of(context).pop();
  }

  //validações
  String validateName(String denominacao) {
    try {
      _service.validatedenominacao(denominacao);
      _nameIsValid = true;
      return null;
    } catch (e) {
      _nameIsValid = false;
      return e.toString();
    }
  }
}
