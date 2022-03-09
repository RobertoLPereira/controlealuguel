import 'package:controlealuguel/app/domain/services/faixa_de_consumo_service.dart';
import 'package:controlealuguel/src/models/apoio/faixadeconsumo.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

class FaixaConsumoFormListBack {
  BuildContext context;
  Faixadeconsumo faixadeconsumo;

  var _service = GetIt.I.get<FaixadeconsumoService>();

  bool _denominacaoIsValid;
  bool _faixainicialIsValid;
  bool _faixafinalIsValid;
  bool _tarifaaguaIsValid;
  bool _tarifaesgotoIsValid;
  bool _tfdiIsValid;
  bool _idimovelIsValid;

  bool get isValid =>
      _denominacaoIsValid &&
      _faixainicialIsValid &&
      _faixafinalIsValid &&
      _tarifaaguaIsValid &&
      _tarifaesgotoIsValid &&
      _tfdiIsValid &&
      _idimovelIsValid;
  // diferenciar novo com alteração
  FaixaConsumoFormListBack(this.context) {
    var parameter = ModalRoute.of(context).settings.arguments;
    faixadeconsumo = (parameter == null) ? Faixadeconsumo() : parameter;
  }

  //salvar
  save(BuildContext context) async {
    await _service.save(faixadeconsumo);
    Navigator.of(context).pop();
  }

  //validações

  String validateDenominacao(String denominacao) {
    try {
      _service.validateDenominacao(denominacao);
      _denominacaoIsValid = true;
      return null;
    } catch (e) {
      _denominacaoIsValid = false;
      return e.toString();
    }
  }

  String validateFaixainicial(String faixainicial) {
    try {
      _service.validateFaixainicial(faixainicial);
      _faixainicialIsValid = true;
      return null;
    } catch (e) {
      _faixainicialIsValid = false;
      return e.toString();
    }
  }

  String validateFaixafinal(String faixafinal) {
    try {
      _service.validateFaixafinal(faixafinal);
      _faixafinalIsValid = true;
      return null;
    } catch (e) {
      _faixafinalIsValid = false;
      return e.toString();
    }
  }

  String validateTarifaagua(String tarifaagua) {
    try {
      _service.validateTarifaagua(tarifaagua);
      _tarifaaguaIsValid = true;
      return null;
    } catch (e) {
      _tarifaaguaIsValid = false;
      return e.toString();
    }
  }

  String validateTarifaesgoto(String tarifaesgoto) {
    try {
      _service.validateTarifaesgoto(tarifaesgoto);
      _tarifaesgotoIsValid = true;
      return null;
    } catch (e) {
      _tarifaesgotoIsValid = false;
      return e.toString();
    }
  }

  String validatetfdi(String tfdi) {
    try {
      _service.validatetfdi(tfdi);
      _tfdiIsValid = true;
      return null;
    } catch (e) {
      _tfdiIsValid = false;
      return e.toString();
    }
  }

  String validateIdimovel(String ididimovel) {
    try {
      _service.validateIdimovel(ididimovel);
      _idimovelIsValid = true;
      return null;
    } catch (e) {
      _idimovelIsValid = false;
      return e.toString();
    }
  }
}
