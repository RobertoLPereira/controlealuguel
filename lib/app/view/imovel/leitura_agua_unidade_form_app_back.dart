import 'package:controlealuguel/app/domain/interfaces/leituraaguaunidade_interface.dart';
import 'package:controlealuguel/src/models/bens/leituraaguaunidade.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class LeituraAguaUnidadeFormAppBack {
  LeituraAguaUnidade leituraaguaunidade;
  var _service = GetIt.I.get<LeituraaguaunidadeInterface>();
  bool _idleituraaguaunidadeIsValid;
  //bool _idunidadeimovelIsValid;
  bool _leituraanteriorIsValid;
  bool _leituraatualIsValid;
  bool _codigomedidorIsValid;
  bool _dataleituraIsValid;
  bool _statusIsValid;
  bool _valorIsValid;

  bool get isValid =>
      _idleituraaguaunidadeIsValid &&
      // _idunidadeimovelIsValid &&
      _leituraanteriorIsValid &&
      _leituraatualIsValid &&
      _codigomedidorIsValid &&
      _dataleituraIsValid &&
      _statusIsValid &&
      _valorIsValid;
  // diferenciar novo com altera��o
  LeituraAguaUnidadeFormBack(BuildContext context) {
    var parameter = ModalRoute.of(context).settings.arguments;
    leituraaguaunidade = (parameter == null) ? LeituraAguaUnidade() : parameter;
  }

  //salvar
  save(BuildContext context) async {
    await _service.save(leituraaguaunidade);
    Navigator.of(context).pop();
  }

  //valida��es
  String validateIdleituraaguaunidade(String idleituraaguaunidade) {
    try {
      validateIdleituraaguaunidade(idleituraaguaunidade);
      _idleituraaguaunidadeIsValid = true;
      return null;
    } catch (e) {
      _idleituraaguaunidadeIsValid = false;
      return e.toString();
    }
  }

  String validateIdunidadeimovel(String idunidadeimovel) {
    try {
      validateIdunidadeimovel(idunidadeimovel);
      // _idunidadeimovelIsValid = true;
      return null;
    } catch (e) {
      //_idunidadeimovelIsValid = false;
      return e.toString();
    }
  }

  String validateLeituraanterior(String leituraanterior) {
    try {
      validateLeituraanterior(leituraanterior);
      _leituraanteriorIsValid = true;
      return null;
    } catch (e) {
      _leituraanteriorIsValid = false;
      return e.toString();
    }
  }

  String validateLeituraatual(String leituraatual) {
    try {
      validateLeituraatual(leituraatual);
      _leituraatualIsValid = true;
      return null;
    } catch (e) {
      _leituraatualIsValid = false;
      return e.toString();
    }
  }

  String validateCodigomedidor(String codigomedidor) {
    try {
      validateCodigomedidor(codigomedidor);
      _codigomedidorIsValid = true;
      return null;
    } catch (e) {
      _codigomedidorIsValid = false;
      return e.toString();
    }
  }

  String validateDataleitura(String dataleitura) {
    try {
      validateDataleitura(dataleitura);
      _dataleituraIsValid = true;
      return null;
    } catch (e) {
      _dataleituraIsValid = false;
      return e.toString();
    }
  }

  String validateStatus(String status) {
    try {
      validateStatus(status);
      _statusIsValid = true;
      return null;
    } catch (e) {
      _statusIsValid = false;
      return e.toString();
    }
  }

  String validateValor(String valor) {
    try {
      validateValor(valor);
      _valorIsValid = true;
      return null;
    } catch (e) {
      _valorIsValid = false;
      return e.toString();
    }
  }

  @override
  String toString() {
    return 'LeituraAguaUnidadeFormAppBack(leituraaguaunidade: $leituraaguaunidade, _idleituraaguaunidadeIsValid: $_idleituraaguaunidadeIsValid,  _leituraanteriorIsValid: $_leituraanteriorIsValid, _leituraatualIsValid: $_leituraatualIsValid, _codigomedidorIsValid: $_codigomedidorIsValid, _dataleituraIsValid: $_dataleituraIsValid, _statusIsValid: $_statusIsValid,_valorIsValid: $_valorIsValid)';
  }
}
