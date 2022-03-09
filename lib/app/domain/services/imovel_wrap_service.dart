import 'package:controlealuguel/app/domain/exception/domain_layer_exception.dart';
import 'package:controlealuguel/src/models/bens/imovelWrap.dart';
import 'package:controlealuguel/src/models/bens/imovelunidade.dart';
import 'package:controlealuguel/src/models/interfaces/bens/imovel_interface.dart';
import 'package:controlealuguel/src/models/pessoas/pessoas.dart';
import 'package:get_it/get_it.dart';

class ImovelWrapService {
  var _dao = GetIt.I.get<ImovelDAO>();
// tem que salvar um contato, ter a possibilidade de alterar e excluir e listar todos os contatos
  Future<List<ImovelWrap>> find() {
    return _dao.find();
  }

  Future<List<Imovelunidade>> listar(int idimovel) {
    return _dao.listar(idimovel);
  }

  Future<List<Pessoas>> getPessoasByProprietario(int idproprietario) {
    return _dao.getPessoasByProprietario(idproprietario);
  }

  Future<List<Pessoas>> getProrietarios() {
    return _dao.getProrietarios();
  }

  remove(dynamic idimovel) async {
    await _dao.remove(idimovel);
  }

  ativar(dynamic idimovel) async {
    await _dao.reativar(idimovel);
  }

  save(ImovelWrap imovelWrap) async {
    validateName(imovelWrap.descricao);
    validateProprietario(imovelWrap.idproprietario);
    await _dao.save(imovelWrap);
  }

// nome → seja obrigatório, tenha no mínimo 3 caracteres e no máximo 50
  validateName(String name) {
    var min = 3;
    var max = 50;

    if (name == null) {
      throw new DomainLayerException('O nome é obrigatório.');
    } else if (name.length < min) {
      throw new DomainLayerException(
          'O nome deve possuir pelo menos $min caracteres.');
    } else if (name.length > max) {
      throw new DomainLayerException(
          'O nome deve possuir no máximo $max caracteres.');
    }
  }

  validateEndereco(String name) {
    var min = 3;
    var max = 50;

    if (name == null) {
      throw new DomainLayerException('O Endereço é obrigatório.');
    } else if (name.length < min) {
      throw new DomainLayerException(
          'O Endereço deve possuir pelo menos $min caracteres.');
    } else if (name.length > max) {
      throw new DomainLayerException(
          'O nome Endereço possuir no máximo $max caracteres.');
    }
  }

// proprietário
  validateProprietario(int idproprietario) {
    if (idproprietario == null) {
      throw new DomainLayerException('O proprietário é obrigatório.');
    }
  }
}
