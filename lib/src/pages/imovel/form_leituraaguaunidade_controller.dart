import 'package:controlealuguel/app/domain/interfaces/leituraaguaunidade_interface.dart';
import 'package:controlealuguel/src/models/bens/leituraaguaunidade.dart';
import 'package:controlealuguel/src/models/bens/leituraluzunidade.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

class LeituraaguaunidadeFormController {
  LeituraAguaUnidade leituraaguaunidade;
  var _interface = GetIt.I.get<LeituraaguaunidadeInterface>();
  bool _idunidadeimovelIsValid;
  bool _leituraanteriorIsValid;
  bool _leituraatualIsValid;
  bool _codigomedidorIsValid;
  bool _dataleituraIsValid;
  bool _statusIsValid;
  bool _valorIsValid;

  bool get isValid =>
      _idunidadeimovelIsValid &&
      _leituraanteriorIsValid &&
      _leituraatualIsValid &&
      _codigomedidorIsValid &&
      _dataleituraIsValid &&
      _statusIsValid &&
      _valorIsValid;
  // diferenciar novo com alteração
  LeituraaguaunidadeFormController(BuildContext context) {
    var parameter = ModalRoute.of(context).settings.arguments;
    leituraaguaunidade = (parameter == null) ? LeituraAguaUnidade() : parameter;
  }

  //salvar
  save(BuildContext context) async {
    print('salvar form_leituraaguaunidade');
    print(leituraaguaunidade);
    await _interface.save(leituraaguaunidade);
    Navigator.of(context).pop();
  }

  //validações
  String validateIdleituraaguaunidade(String idleituraaguaunidade) {
    try {
      validarIdleituraaguaunidade(idleituraaguaunidade);
      //_idleituraaguaunidadeIsValid = true;
      return null;
    } catch (e) {
      //_idleituraaguaunidadeIsValid = false;
      return e.toString();
    }
  }

  String validateIdunidadeimovel(String idunidadeimovel) {
    try {
      validarIdunidadeimovel(idunidadeimovel);
      _idunidadeimovelIsValid = true;
      return null;
    } catch (e) {
      _idunidadeimovelIsValid = false;
      return e.toString();
    }
  }

  String validateLeituraanterior(String leituraanterior) {
    try {
      validarLeituraanterior(leituraanterior);
      _leituraanteriorIsValid = true;
      return null;
    } catch (e) {
      _leituraanteriorIsValid = false;
      return e.toString();
    }
  }

  String validateLeituraatual(String leituraatual) {
    try {
      validarLeituraatual(leituraatual);
      _leituraatualIsValid = true;
      return null;
    } catch (e) {
      _leituraatualIsValid = false;
      return e.toString();
    }
  }

  String validateCodigomedidor(String codigomedidor) {
    try {
      validarCodigomedidor(codigomedidor);
      _codigomedidorIsValid = true;
      return null;
    } catch (e) {
      _codigomedidorIsValid = false;
      return e.toString();
    }
  }

  String validateDataleitura(String dataleitura) {
    try {
      validarDataleitura(dataleitura);
      _dataleituraIsValid = true;
      return null;
    } catch (e) {
      _dataleituraIsValid = false;
      return e.toString();
    }
  }

  String validateStatus(String status) {
    try {
      validarStatus(status);
      _statusIsValid = true;
      return null;
    } catch (e) {
      _statusIsValid = false;
      return e.toString();
    }
  }

  String validateValor(String valor) {
    try {
      validarValor(valor);
      _valorIsValid = true;
      return null;
    } catch (e) {
      _valorIsValid = false;
      return e.toString();
    }
  }

  void validarIdleituraaguaunidade(String idleituraaguaunidade) {
    if (idleituraaguaunidade == null) {
      throw DomainLayerException('O idleituraaguaunidade é obrigatório.');
    }
  }

  void validarIdunidadeimovel(String idunidadeimovel) {
    if (idunidadeimovel == null) {
      throw DomainLayerException('A Unida do imovel é obrigatória.');
    }
  }

  void validarLeituraanterior(String leituraanterior) {
    if (leituraanterior == null) {
      throw DomainLayerException('A leitura Anterior é obrigatório.');
    }
  }

  void validarLeituraatual(String leituraatual) {
    if (leituraatual == null) {
      throw DomainLayerException('A leitura Atual é obrigatório.');
    }
  }

  void validarCodigomedidor(String codigomedidor) {
    if (codigomedidor == null) {
      throw DomainLayerException('O codigo do Medidor é obrigatório.');
    }
  }

//dataleitura ? seja obrigatório, tenha no mínimo 3 caracteres e no máximo 50
  void validarDataleitura(String dataleitura) {
    print('validar data');
    print(dataleitura);
    var min = 8;
    var max = 10;
    if (dataleitura == null) {
      throw DomainLayerException('A data da Leitura é obrigatória.');
    } else if (dataleitura.length < min) {
      throw DomainLayerException(
          'A data da leitura deve possuir pelo menos $min caracteres.');
    } else if (dataleitura.length > max) {
      throw DomainLayerException(
          'a data da leitura deve possuir no máximo $max caracteres.');
    }
  }

  void validarStatus(String status) {
    if (status == null) {
      throw DomainLayerException('O status é obrigatório.');
    }
  }

  void validarValor(String valor) {
    if (valor == null) {
      throw DomainLayerException('O valor é obrigatório.');
    }
  }
}
