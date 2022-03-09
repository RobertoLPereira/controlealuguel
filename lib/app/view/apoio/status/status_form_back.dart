import '../../../domain/entities/status.dart';
import '../../../../app/domain/services/status_service.dart';

import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

class StatusFormBack {
  Status status;
  var _service = GetIt.I.get<StatusService>();
  bool _nameIsValid;

  bool get isValid => _nameIsValid;

  // diferenciar novo com alteração
  StatusFormBack(BuildContext context) {
    var parameter = ModalRoute.of(context).settings.arguments;
    status = (parameter == null) ? Status() : parameter;
  }

  //salvar
  save(BuildContext context) async {
    print(status);
    await _service.save(status);
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
