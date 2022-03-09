// ignore: unused_import
import 'package:controlealuguel/app/domain/interfaces/natrelac_dao.dart';
import 'package:controlealuguel/src/models/apoio/naturezarelacionamentos.dart';
import 'package:controlealuguel/src/models/interfaces/apoio/naturezarelacionamento_interface.dart';
import '../../../app/domain/exception/domain_layer_exception.dart';
import 'package:get_it/get_it.dart';

class NatRelacService {
  var _dao = GetIt.I.get<NaturezarelacionamentoDAO>();
// tem que salvar um contato, ter a possibilidade de alterar e excluir e listar todos os contatos
  save(Naturezarelacionamento natrelac) async {
    validatedenominacao(natrelac.denominacao);
    await _dao.save(natrelac);
  }

  remove(dynamic id) async {
    await _dao.remove(id);
  }

  Future<List<Naturezarelacionamento>> find() {
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
