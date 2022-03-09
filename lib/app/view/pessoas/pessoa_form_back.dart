import 'package:controlealuguel/app/domain/services/pessoas_wrap_service.dart';
import 'package:controlealuguel/src/models/pessoas/pessoas_wrap.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

class PessoasWrapFormBack {
  PessoasWrap pessoasWrap;
  var _service = GetIt.I.get<PessoasWrapService>();
  bool _nameIsValid;
  bool _emailIsValid;
  bool _phoneIsValid;

  bool get isValid => _nameIsValid && _emailIsValid && _phoneIsValid;

  // diferenciar novo com alteração
  PessoasWrapFormBack(BuildContext context) {
    var parameter = ModalRoute.of(context).settings.arguments;
    pessoasWrap = (parameter == null) ? PessoasWrap() : parameter;
  }

  //salvar
  save(BuildContext context) async {
    await _service.save(pessoasWrap);
    Navigator.of(context).pop();
  }

  //validações
  String validateName(String name) {
    try {
      _service.validateName(name);
      _nameIsValid = true;
      return null;
    } catch (e) {
      _nameIsValid = false;
      return e.toString();
    }
  }

  String validateEmail(String email) {
    try {
      _service.validateEmail(email);
      _emailIsValid = true;
      return null;
    } catch (e) {
      _emailIsValid = false;
      return e.toString();
    }
  }

  String validatePhone(String phone) {
    try {
      _service.validatePhone(phone);
      _phoneIsValid = true;
      return null;
    } catch (e) {
      _phoneIsValid = false;
      return e.toString();
    }
  }
}
