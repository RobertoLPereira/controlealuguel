import 'package:controlealuguel/app/domain/services/faixa_de_consumo_service.dart';
import 'package:controlealuguel/src/models/apoio/faixadeconsumo.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

class FaixadeconsumoFormBack {
  Faixadeconsumo faixadeconsumo;
  var _service = GetIt.I.get<FaixadeconsumoService>();
//	bool _idfaixadeconsumoIsValid;
  bool _denominacaoIsValid;
  bool _faixainicialIsValid;
  bool _faixafinalIsValid;
  bool _tarifaaguaIsValid;
  bool _tarifaesgotoIsValid;
  bool _tfdiIsValid;
  bool _idcategoriadeimoveisIsValid;

  bool get isValid => //_idfaixadeconsumoIsValid &&
      _denominacaoIsValid &&
      _faixainicialIsValid &&
      _faixafinalIsValid &&
      _tarifaaguaIsValid &&
      _tarifaesgotoIsValid &&
      _tfdiIsValid &&
      _idcategoriadeimoveisIsValid;
  // diferenciar novo com alteração
  FaixadeconsumoFormBack(BuildContext context) {
    var parameter = ModalRoute.of(context).settings.arguments;
    faixadeconsumo = (parameter == null) ? Faixadeconsumo() : parameter;
  }

  //salvar
  save(BuildContext context) async {
    await _service.save(faixadeconsumo);
    Navigator.of(context).pop();
  }

  //validações
  String validateIdfaixadeconsumo(String idfaixadeconsumo) {
    try {
      //_service.validateIdfaixadeconsumo(idfaixadeconsumo);
      // _idfaixadeconsumoIsValid = true;
      return null;
    } catch (e) {
      // _idfaixadeconsumoIsValid = false;
      return e.toString();
    }
  }

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
      _service.validateFaixainicial(faixainicial.toString());
      _faixainicialIsValid = true;
      return null;
    } catch (e) {
      _faixainicialIsValid = false;
      return e.toString();
    }
  }

  String validateFaixafinal(String faixafinal) {
    try {
      _service.validateFaixafinal(faixafinal.toString());
      _faixafinalIsValid = true;
      return null;
    } catch (e) {
      _faixafinalIsValid = false;
      return e.toString();
    }
  }

  String validateTarifaagua(String tarifaagua) {
    try {
      _service.validateTarifaagua(tarifaagua.toString());
      _tarifaaguaIsValid = true;
      return null;
    } catch (e) {
      _tarifaaguaIsValid = false;
      return e.toString();
    }
  }

  String validateTarifaesgoto(String tarifaesgoto) {
    try {
      _service.validateTarifaesgoto(tarifaesgoto.toString());
      _tarifaesgotoIsValid = true;
      return null;
    } catch (e) {
      _tarifaesgotoIsValid = false;
      return e.toString();
    }
  }

  String validatetfdi(String tfdi) {
    try {
      _service.validatetfdi(tfdi.toString());
      _tfdiIsValid = true;
      return null;
    } catch (e) {
      _tfdiIsValid = false;
      return e.toString();
    }
  }

  String validateIdimovel(String idimovel) {
    try {
      _service.validateIdimovel(idimovel.toString());
      _idcategoriadeimoveisIsValid = true;
      return null;
    } catch (e) {
      _idcategoriadeimoveisIsValid = false;
      return e.toString();
    }
  }
}
