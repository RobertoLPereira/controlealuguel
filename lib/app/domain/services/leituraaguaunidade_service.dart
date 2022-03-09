import 'package:controlealuguel/app/domain/exception/domain_layer_exception.dart';
import 'package:controlealuguel/app/domain/interfaces/leituraaguaunidade_interface.dart';
import 'package:controlealuguel/src/models/bens/leituraaguaunidade.dart';
import 'package:get_it/get_it.dart';

class LeituraaguaunidadeService {
  var _dao = GetIt.I.get<LeituraaguaunidadeInterface>();
  var format = RegExp(
      r'^\([1-9]{2}\) [9] [6-9]{1}[0-9]{3}\-[0-9]{4}$'); // (99) 9 9999-9999
  // tem que salvar um leituraaguaunidade, ter a possibilidade de alterar e excluir e listar todos os contatos
  save(LeituraAguaUnidade leituraaguaunidade) async {
    validateIdleituraaguaunidade(
        leituraaguaunidade.idleituraaguaunidade.toString());

    validateIdunidadeimovel(leituraaguaunidade.idunidadeimovel.toString());

    validateLeituraanterior(leituraaguaunidade.leituraanterior.toString());

    validateLeituraatual(leituraaguaunidade.leituraatual.toString());

    validateCodigomedidor(leituraaguaunidade.codigomedidor.toString());

    validateDataleitura(leituraaguaunidade.dataleitura);

    validateStatus(leituraaguaunidade.status.toString());
    validateValor(leituraaguaunidade.valor.toString());

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
      throw new DomainLayerException('O idleituraaguaunidade é obrigatório.');
    }
  }

//idunidadeimovel ? seja obrigat�rio, tenha no m�nimo 3 caracteres e no m�ximo 50
  validateIdunidadeimovel(String idunidadeimovel) {
    if (idunidadeimovel == null) {
      throw new DomainLayerException('O idunidadeimovel é obrigatória.');
    }
  }

//leituraanterior ? seja obrigat�rio, tenha no m�nimo 3 caracteres e no m�ximo 50
  validateLeituraanterior(String leituraanterior) {
    if (leituraanterior == null) {
      throw new DomainLayerException('O leituraanterior é obrigatória.');
    }
  }

//leituraatual ? seja obrigat�rio, tenha no m�nimo 3 caracteres e no m�ximo 50
  validateLeituraatual(String leituraatual) {
    if (leituraatual == null) {
      throw new DomainLayerException('O leituraatual é obrigatória.');
    }
  }

//codigomedidor ? seja obrigat�rio, tenha no m�nimo 3 caracteres e no m�ximo 50
  validateCodigomedidor(String codigomedidor) {
    if (codigomedidor == null) {
      throw new DomainLayerException('O codigomedidor é obrigatório.');
    }
  }

//dataleitura ? seja obrigat�rio, tenha no m�nimo 3 caracteres e no m�ximo 50
  validateDataleitura(DateTime dataleitura) {
    if (dataleitura == null) {
      throw new DomainLayerException('A dataleitura é obrigatória.');
    }
  }

//status ? seja obrigat�rio, tenha no m�nimo 3 caracteres e no m�ximo 50
  validateStatus(String status) {
    if (status == null) {
      throw new DomainLayerException('O status é obrigatório.');
    }
  }

  //valor ? seja obrigat�rio,
  validateValor(String valor) {
    if (valor == null) {
      throw new DomainLayerException('O Valor é obrigatória.');
    }
  }
}
