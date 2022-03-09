import 'package:controlealuguel/app/domain/interfaces/pagamento_dao.dart';
import 'package:controlealuguel/src/models/pagamento/pagamentos.dart';

import '../../../app/domain/exception/domain_layer_exception.dart';
import 'package:get_it/get_it.dart';

class PagamentoService {
  var _dao = GetIt.I.get<PagamentoDAO>();
// tem que salvar um contato, ter a possibilidade de alterar e excluir e listar todos os contatos
  save(Pagamentos pagamento) async {
    //print('vou validar o pagamento');
    validateContrato(pagamento.idcontrato);
    validateDataPgto(pagamento.datapagamento);
    validateValor(pagamento.valorpago.toString());
    //print('vou salvar');
    await _dao.save(pagamento);
  }

  remove(dynamic id) async {
    await _dao.remove(id);
  }

  Future<List<Pagamentos>> find() {
    return _dao.find();
  }

// nome → seja obrigatório, tenha no mínimo 3 caracteres e no máximo 50
  validateContrato(dynamic idcontrato) {
    if (idcontrato == null || idcontrato == 0) {
      throw new DomainLayerException(
          'O Contrato não foi informado. É obrigatório.');
    }
  }

// e-mail → seja obrigatório e tenha @
  validateDataPgto(String dtpgto) {
    if (dtpgto == null) {
      throw new DomainLayerException('A Data do pagamento é obrigatório.');
    }
  }

// telefone → seja obrigatório e tenha o formato (99) 9 9999-9999
  validateValor(String vlr) {
    //var format = RegExp(
    //    r'^\([1-9]{2}\) [9] [6-9]{1}[0-9]{3}\-[0-9]{4}$'); // (99) 9 9999-9999
    if (validateValor == null) {
      throw new DomainLayerException('O Valor é obrigatório.');
    }
  }
}
