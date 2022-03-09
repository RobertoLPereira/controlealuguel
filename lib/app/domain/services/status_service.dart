import '../../../app/domain/interfaces/statust_dao.dart';
import '../entities/status.dart';
import '../../../app/domain/exception/domain_layer_exception.dart';
import 'package:get_it/get_it.dart';

class StatusService {
  var _dao = GetIt.I.get<StatusDAO>();
// tem que salvar um contato, ter a possibilidade de alterar e excluir e listar todos os contatos
  save(Status status) async {
    validatedenominacao(status.denominacao);
    await _dao.save(status);
  }

  remove(dynamic id) async {
    await _dao.remove(id);
  }

  Future<List<Status>> find() {
    return _dao.find();
  }

// denominacao → seja obrigatório, tenha no mínimo 3 caracteres e no máximo 50
  validatedenominacao(String denominacao) {
    var min = 3;
    var max = 50;

    if (denominacao == null) {
      throw new DomainLayerException('O denominacao é obrigatório.');
    } else if (denominacao.length < min) {
      throw new DomainLayerException(
          'O denominacao deve possuir pelo menos $min caracteres.');
    } else if (denominacao.length > max) {
      throw new DomainLayerException(
          'O denominacao deve possuir no máximo $max caracteres.');
    }
  }
}
