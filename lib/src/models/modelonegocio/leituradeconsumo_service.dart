import '../../models/bens/leituraaguaunidade.dart';
import '../../models/exceptions/domainlayerexception.dart';
import 'package:get_it/get_it.dart';
import 'leituradeconsumo_interface.dart';

class LeituradeConsumoService {
  var _dao = GetIt.I.get<LeituraDeConsumoInterface>();
  var format = RegExp(
      r'^\([1-9]{2}\) [9] [6-9]{1}[0-9]{3}\-[0-9]{4}$'); // (99) 9 9999-9999
  // tem que salvar um leituraaguaunidade, ter a possibilidade de alterar e excluir e listar todos os contatos
  save(LeituraAguaUnidade leituraaguaunidade) async {
    validateIdunidadeimovel(leituraaguaunidade.idunidadeimovel.toString());
    validateLeituraanterior(leituraaguaunidade.leituraanterior.toString());
    validateLeituraatual(leituraaguaunidade.leituraatual.toString());
    validateCodigomedidor(leituraaguaunidade.codigomedidor);
    validateDataleitura(leituraaguaunidade.dataleitura.toString());
    validateStatus(leituraaguaunidade.status.toString());
    await _dao.save(leituraaguaunidade);
  }

  remove(dynamic id) {
    _dao.remove(id);
  }

  Future<List<LeituraAguaUnidade>> find() {
    return _dao.find();
  }

  validateIdleituraaguaunidade(String idleituraaguaunidade) {
    if (idleituraaguaunidade == null) {
      throw DomainLayerException('O idleituraaguaunidade é obrigatório.');
    }
  }

  validateIdunidadeimovel(String idunidadeimovel) {
    if (idunidadeimovel == null) {
      throw DomainLayerException('A unidade de imovel é obrigatório.');
    }
  }

  validateLeituraanterior(String leituraanterior) {
    if (leituraanterior == null) {
      throw DomainLayerException('O leituraanterior é obrigatório.');
    }
  }

  validateLeituraatual(String leituraatual) {
    if (leituraatual == null) {
      throw DomainLayerException('O leituraatual é obrigatório.');
    }
  }

  validateCodigomedidor(String codigomedidor) {
    if (codigomedidor == null) {
      throw DomainLayerException('O codigomedidor é obrigatório.');
    }
  }

//dataleitura ? seja obrigatório, tenha no mónimo 3 caracteres e no móximo 50
  validateDataleitura(String dataleitura) {
    if (dataleitura == null) {
      throw DomainLayerException('A dataleitura é obrigatório.');
    }
  }

  validateStatus(String status) {
    if (status == null) {
      throw DomainLayerException('O status ó obrigatório.');
    }
  }
}
