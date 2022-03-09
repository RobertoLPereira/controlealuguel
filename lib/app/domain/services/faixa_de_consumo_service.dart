import 'package:controlealuguel/app/domain/exception/domain_layer_exception.dart';
import 'package:controlealuguel/app/domain/interfaces/faixadeconsumo_interface.dart';
import 'package:controlealuguel/src/models/apoio/faixadeconsumo.dart';
import 'package:get_it/get_it.dart';

class FaixadeconsumoService {
  var _dao = GetIt.I.get<FaixadeconsumoInterface>();
  var format = RegExp(
      r'^\([1-9]{2}\) [9] [6-9]{1}[0-9]{3}\-[0-9]{4}$'); // (99) 9 9999-9999
  // tem que salvar um faixadeconsumo, ter a possibilidade de alterar e excluir e listar todos os contatos
  save(Faixadeconsumo faixadeconsumo) async {
    validateDenominacao(faixadeconsumo.denominacao.toString());

    validateFaixainicial(faixadeconsumo.faixainicial.toString());

    validateFaixafinal(faixadeconsumo.faixafinal.toString());

    validateTarifaagua(faixadeconsumo.tarifaagua.toString());

    validateTarifaesgoto(faixadeconsumo.tarifaesgoto.toString());

    //validatetfdi(faixadeconsumo.tfdi.toString().replaceAll(RegExp(r','), '.'));
    validatetfdi(faixadeconsumo.tfdi.toString());
    validateIdimovel(faixadeconsumo.idimovel.toString());
    await _dao.save(faixadeconsumo);
  }

  remove(dynamic id) {
    _dao.remove(id);
  }

  Future<List<Faixadeconsumo>> find() {
    return _dao.find();
  }

//denominacao ? seja obrigatório, tenha no mínimo 3 caracteres e no máximo 50
  validateDenominacao(String denominacao) {
    var min = 3;
    var max = 50;
    if (denominacao == null) {
      throw DomainLayerException('O denominacao é obrigatório.');
    } else if (denominacao.length < min) {
      throw DomainLayerException(
          'O denominacao deve possuir pelo menos $min caracteres.');
    } else if (denominacao.length > max) {
      throw DomainLayerException(
          'O denominacao deve possuir no máximo $max caracteres.');
    }
  }

  validateFaixainicial(String faixainicial) {
    if (faixainicial == null) {
      throw DomainLayerException('O faixainicial é obrigatório.');
    }
  }

  validateFaixafinal(String faixafinal) {
    if (faixafinal == null) {
      throw DomainLayerException('O faixafinal é obrigatório.');
    }
  }

  validateTarifaagua(String tarifaagua) {
    if (tarifaagua == null) {
      throw DomainLayerException('O tarifaagua é obrigatório.');
    }
  }

  validateTarifaesgoto(String tarifaesgoto) {
    if (tarifaesgoto == null) {
      throw DomainLayerException('O tarifaesgoto é obrigatório.');
    }
  }

  validatetfdi(String tfdi) {
    if (tfdi == null) {
      throw DomainLayerException('O tfdi é obrigatório.');
    }
  }

  validateIdimovel(String idimovel) {
    if (idimovel == null) {
      throw DomainLayerException('O Imovel é obrigatório.');
    }
  }
}
