import 'package:controlealuguel/src/models/apoio/categorias.dart';
import '../../../app/domain/interfaces/categoriadeimoveis_dao.dart';
import '../../../app/domain/exception/domain_layer_exception.dart';
import 'package:get_it/get_it.dart';

class CategoriadeImoveisService {
  var _dao = GetIt.I.get<CategoriadeImoveisDAO>();
// tem que salvar um contato, ter a possibilidade de alterar e excluir e listar todos os contatos
  save(Categorias categoriadeimoveis) async {
    validatedenominacao(categoriadeimoveis.denominacao);
    await _dao.save(categoriadeimoveis);
  }

  remove(dynamic id) async {
    await _dao.remove(id);
  }

  Future<List<Categorias>> find() {
    return _dao.find();
  }

// denominacao → seja obrigatório, tenha no mínimo 3 caracteres e no máximo 50
  validatedenominacao(String denominacao) {
    var min = 3;
    var max = 20;

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
