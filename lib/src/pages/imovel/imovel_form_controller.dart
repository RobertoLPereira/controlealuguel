import 'dart:convert';

import 'package:controlealuguel/app/domain/entities/unidade_imovel.dart';
import 'package:controlealuguel/app/domain/exception/domain_layer_exception.dart';
import 'package:controlealuguel/src/models/bens/imovelWrap.dart';
import 'package:controlealuguel/src/models/interfaces/bens/imovel_interface.dart';
import 'package:controlealuguel/src/models/interfaces/bens/imovelunidade_interface.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

import '../../../src/models/bens/imovel.dart';

class ImovelFormController {
  Imovel imovel;
  ImovelWrap imovelwrap;
  var _service = GetIt.I.get<ImovelDAO>();
  var _serviceUnid = GetIt.I.get<ImovelUnidadeDAO>();

  bool _descricaoIsValid;
  bool _enderecoIsValid;
  //bool _idproprietarioIsValid;
  //bool _statusIsValid;
  //bool _idimovelcategoriaIsValid;

  bool get isValid => _descricaoIsValid && _enderecoIsValid;
  // _idproprietarioIsValid &&
  // _statusIsValid &&
  // _idimovelcategoriaIsValid;
  // diferenciar novo com alteração
  ImovelFormController(BuildContext context) {
    var parameter = ModalRoute.of(context).settings.arguments;
    imovelwrap = (parameter == null) ? ImovelWrap() : parameter;
  }
  //salvar
  save(BuildContext context) async {
    //print(imovelwrap);
    Response imv = await _service.save(imovelwrap);
    int idimovel;
    if (imv.statusCode == 204) {
      idimovel = imovelwrap.idimovel;
    } else {
      dynamic im = json.decode(imv.body);
      idimovel = im['idimovel'];
    }
    //Quando for informadoa a quantidade de unidade e seu tipo(Nome)
    //Crair as unidades automaticamente
    if (imovelwrap.qtdunidade > 0 && imovelwrap.nomeunidade != null) {
      UnidadeImovel unid = UnidadeImovel();
      for (int i = 1; i <= imovelwrap.qtdunidade; i++) {
        unid.descricao = imovelwrap.nomeunidade + ' Nº ' + i.toString();
        unid.idimovel = idimovel.toString();
        unid.idimovelcategoria = "1";
        unid.idlocatario = "0";
        _serviceUnid.save(unid);
      }
    }
    Navigator.of(context).pop();
  }

  //validações
  String validateDescricao(String descricao) {
    try {
      validateDesc(descricao);
      _descricaoIsValid = true;
      return null;
    } catch (e) {
      _descricaoIsValid = false;
      return e.toString();
    }
  }

  String validateEndereco(String endereco) {
    try {
      validateEnd(endereco);
      _enderecoIsValid = true;
      return null;
    } catch (e) {
      _enderecoIsValid = false;
      return e.toString();
    }
  }

  String validateProprietario(String id) {
    try {
      validateIdproprietario(int.parse(id));
      //_idproprietarioIsValid = true;
      return null;
    } catch (e) {
      // _idproprietarioIsValid = false;
      return e.toString();
    }
  }

  String validateIdimovelcategoria(String id) {
    try {
      validateIdproprietario(int.parse(id));
      //_idimovelcategoriaIsValid = true;
      return null;
    } catch (e) {
      //_idimovelcategoriaIsValid = false;
      return e.toString();
    }
  }

  String validateStatus(String id) {
    try {
      validateIdStatus(int.parse(id));
      //_statusIsValid = true;
      return null;
    } catch (e) {
      //_statusIsValid = false;
      return e.toString();
    }
  }

  validateImovel(int idimovel) {
    if (idimovel == null) {
      throw new DomainLayerException('O idimovel é obrigatório.');
    }
  }
}

void validateDesc(String descricao) {
  var min = 3;
  var max = 100;
  if (descricao == null) {
    throw new DomainLayerException('A descricao é obrigatória!');
  } else if (descricao.length < min) {
    throw new DomainLayerException(
        'A descricao deve possuir pelo menos $min caracteres.');
  } else if (descricao.length > max) {
    throw new DomainLayerException(
        'A descricao deve possuir no máximo $max caracteres.');
  }
}

void validateEnd(String endereco) {
  var min = 3;
  var max = 100;
  if (endereco == null) {
    throw new DomainLayerException('O endereço é obrigatório!');
  } else if (endereco.length < min) {
    throw new DomainLayerException(
        'O endereco deve possuir pelo menos $min caracteres.');
  } else if (endereco.length > max) {
    throw new DomainLayerException(
        'O endereco deve possuir no máximo $max caracteres.');
  }
}

void validateIdStatus(int id) {
  if (id == null) {
    throw new DomainLayerException('A situação é obrigatória!');
  }
}

void validateIdproprietario(int id) {
  if (id == null) {
    throw new DomainLayerException('O proprietário é obrigatório!');
  }
}
