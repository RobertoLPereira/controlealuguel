import 'package:controlealuguel/app/domain/services/naturezarelacionamento_service.dart';
import 'package:controlealuguel/src/models/apoio/naturezarelacionamentos.dart';

import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

class NatRelacFormBack {
  Naturezarelacionamento natrelac;
  var _service = GetIt.I.get<NatRelacService>();
  bool _nameIsValid;

  bool get isValid => _nameIsValid;

  // diferenciar novo com alteração
  NatRelacFormBack(BuildContext context) {
    var parameter = ModalRoute.of(context).settings.arguments;
    natrelac = (parameter == null) ? Naturezarelacionamento() : parameter;
  }

  //salvar
  save(BuildContext context) async {
    print(natrelac);
    await _service.save(natrelac);
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
