import 'package:controlealuguel/app/domain/services/pagamento_service.dart';
import 'package:controlealuguel/src/models/pagamento/pagamentos.dart';
import 'package:controlealuguel/src/models/pessoas/pessoas_wrap.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

class FormPagamentoBack {
  PessoasWrap pessoa;
  Pagamentos pagto;
  var _service = GetIt.I.get<PagamentoService>();
  bool _contratoValid;
  bool _dataValid;
  bool _valorValid;

  bool get isValid => _contratoValid && _dataValid && _valorValid;

  // diferenciar novo com alteração
  FormPagamentoBack(BuildContext context) {
    var parameter = ModalRoute.of(context).settings.arguments;
    //print(parameter);
    pessoa = (parameter == null) ? PessoasWrap() : parameter;
  }

  //salvar
  save(BuildContext context) async {
    String dtpgto = DateTime.now().year.toString();
    dtpgto += '-' + DateTime.now().month.toString();
    dtpgto += '-' + DateTime.now().day.toString();
    var pag = Pagamentos(
      idpagamento: null,
      datapagamento: dtpgto,
      valorpago: pessoa.valor,
      juros: 0.00,
      desconto: 0.00,
      idcontrato: pessoa.idcontrato,
    );
    await _service.save(pag);
    Navigator.of(context).pop();
  }

  //validações
  String validateContrato(int idcontrato) {
    try {
      _service.validateContrato(idcontrato);
      _contratoValid = true;
      return null;
    } catch (e) {
      _contratoValid = false;
      return e.toString();
    }
  }

  String validateValorPagar(String vlr) {
    try {
      _service.validateValor(vlr);
      _valorValid = true;
      return null;
    } catch (e) {
      _valorValid = false;
      return e.toString();
    }
  }

  String validateData(String datapg) {
    try {
      _service.validateDataPgto(datapg);
      _dataValid = true;
      return null;
    } catch (e) {
      _dataValid = false;
      return e.toString();
    }
  }
}
