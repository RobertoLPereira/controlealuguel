import 'package:controlealuguel/app/domain/services/pagamento_service.dart';
import 'package:controlealuguel/src/models/pessoas/pessoas_wrap.dart';
import '../../../app/domain/services/contact_service.dart';
import '../../../src/models/pagamento/pagamentos.dart';
import '../../../app/domain/entities/contact.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

class PagamentoFormBack {
  Contact contact;
  Pagamentos pagto;
  PessoasWrap pessoawrap;
  // ignore: unused_field
  var _servicePagto = GetIt.I.get<PagamentoService>();
  var _service = GetIt.I.get<ContactService>();
  bool _nameIsValid = true;
  bool _emailIsValid = true;
  bool _phoneIsValid = true;

  bool get isValid => _nameIsValid && _emailIsValid && _phoneIsValid;

  // diferenciar novo com alteração
  ContactFormBack(BuildContext context) {
    var parameter = ModalRoute.of(context).settings.arguments;
    contact = (parameter == null) ? Contact() : parameter;
  }

  PagamentoFormBack(BuildContext context) {
    var parameter = ModalRoute.of(context).settings.arguments;
    pessoawrap = (parameter == null) ? PessoasWrap() : parameter;
  }

  //salvar
  save(BuildContext context) async {
    print(pessoawrap);
    String dtpgto = DateTime.now().year.toString();
    dtpgto += '-' + DateTime.now().month.toString();
    dtpgto += '-' + DateTime.now().day.toString();
    print(dtpgto);
    pagto.datapagamento = dtpgto.toString();
    pagto.valorpago = pessoawrap.valor;
    pagto.juros = 0.00;
    pagto.desconto = 0.00;
    pagto.idcontrato = pessoawrap.idcontrato;
    print(pagto);
    await _servicePagto.save(pagto);
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
  } //validateValorPagar

  String validateValorPagar(String vlr) {
    try {
      _servicePagto.validateValor(vlr);
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
