import 'package:controlealuguel/src/models/bens/leituraaguaunidade.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

import 'leitura_de_consumo.dart';
import 'leituradeconsumo_service.dart';

class LeituraDeConsumoFormBack {
  LeituraDeConsumo consumo;
  var _service = GetIt.I.get<LeituradeConsumoService>();

  bool _idunidadeimovelIsValid;
  bool _leituraanteriorIsValid;
  bool _leituraatualIsValid;
  bool _codigomedidorIsValid;
  bool _dataleituraIsValid;
  bool _statusIsValid;

  bool get isValid =>
      _idunidadeimovelIsValid &&
      _leituraanteriorIsValid &&
      _leituraatualIsValid &&
      _codigomedidorIsValid &&
      _dataleituraIsValid &&
      _statusIsValid;
  // diferenciar novo com alteração
  LeituraDeConsumoFormBack(BuildContext context) {
    var parameter = ModalRoute.of(context).settings.arguments;
    consumo = (parameter == null) ? LeituraDeConsumo() : parameter;
  }

  //salvar
  save(BuildContext context) async {
    LeituraAguaUnidade leitura = LeituraAguaUnidade();
    //Converte do modelo de negócio para o modelo fisico
    LeituraDeConsumo consumo = LeituraDeConsumo();
    leitura.codigomedidor = consumo.codigomedidoragua as String;
    leitura.dataleitura = consumo.dataleituraagua;
    leitura.idunidadeimovel = consumo.idunidadeimovel as String;
    leitura.leituraanterior = consumo.leituraanterior as String;
    leitura.leituraatual = consumo.leituraatual as String;
    leitura.status = consumo.status.toString();
    leitura.valor = consumo.valor as String;
    await _service.save(leitura);
    Navigator.of(context).pop();
  }

  //validações
  String validateIdleituraaguaunidade(String idleituraaguaunidade) {
    try {
      _service.validateIdleituraaguaunidade(idleituraaguaunidade);
      return null;
    } catch (e) {
      return e.toString();
    }
  }

  String validateIdunidadeimovel(String idunidadeimovel) {
    try {
      _service.validateIdunidadeimovel(idunidadeimovel);
      _idunidadeimovelIsValid = true;
      return null;
    } catch (e) {
      _idunidadeimovelIsValid = false;
      return e.toString();
    }
  }

  String validateLeituraanterior(String leituraanterior) {
    try {
      _service.validateLeituraanterior(leituraanterior);
      _leituraanteriorIsValid = true;
      return null;
    } catch (e) {
      _leituraanteriorIsValid = false;
      return e.toString();
    }
  }

  String validateLeituraatual(String leituraatual) {
    try {
      _service.validateLeituraatual(leituraatual);
      _leituraatualIsValid = true;
      return null;
    } catch (e) {
      _leituraatualIsValid = false;
      return e.toString();
    }
  }

  String validateCodigomedidor(String codigomedidor) {
    try {
      _service.validateCodigomedidor(codigomedidor);
      _codigomedidorIsValid = true;
      return null;
    } catch (e) {
      _codigomedidorIsValid = false;
      return e.toString();
    }
  }

  String validateDataleitura(String dataleitura) {
    try {
      _service.validateDataleitura(dataleitura);
      _dataleituraIsValid = true;
      return null;
    } catch (e) {
      _dataleituraIsValid = false;
      return e.toString();
    }
  }

  String validateStatus(String status) {
    try {
      _service.validateStatus(status);
      _statusIsValid = true;
      return null;
    } catch (e) {
      _statusIsValid = false;
      return e.toString();
    }
  }
}
