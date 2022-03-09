import 'package:controlealuguel/app/domain/interfaces/pessoas_wrap_dao.dart';
import 'package:controlealuguel/src/models/pessoas/pessoas_wrap.dart';

import '../../../app/domain/entities/imovel.dart';
import '../../../app/domain/exception/domain_layer_exception.dart';
import '../../../app/domain/interfaces/imovel_interface.dart';
import 'package:get_it/get_it.dart';

class ImovelService {
  var _dao = GetIt.I.get<ImovelInterface>();
  var _daoProprietarios = GetIt.I.get<PessoasWrapDAO>();
  var format = RegExp(
      r'^\([1-9]{2}\) [9] [6-9]{1}[0-9]{3}\-[0-9]{4}$'); // (99) 9 9999-9999
  // tem que salvar um imovel, ter a possibilidade de alterar e excluir e listar todos os contatos
  save(Imovel imovel) async {
    validateIdimovel(imovel.idimovel);

    validateDescricao(imovel.descricao);

    validateEndereco(imovel.endereco);

    validateIdproprietario(imovel.idproprietario);

    validateStatus(imovel.status);

    validateIdimovelcategoria(imovel.idimovelcategoria);

    await _dao.save(imovel);
  }

  remove(dynamic id) {
    _dao.remove(id);
  }

  Future<List<Imovel>> find() {
    return _dao.find();
  }

  Future<List<PessoasWrap>> listarProprietarios() {
    return _daoProprietarios.find();
  }

  validateIdimovel(int idimovel) {
    if (idimovel == null) {
      throw new DomainLayerException('O idimovel é obrigatório.');
    }
  }

  validateDescricao(String descricao) {
    var min = 3;
    var max = 50;
    if (descricao == null) {
      throw new DomainLayerException('O descricao é obrigatório.');
    } else if (descricao.length < min) {
      throw new DomainLayerException(
          'O descricao deve possuir pelo menos $min caracteres.');
    } else if (descricao.length > max) {
      throw new DomainLayerException(
          'O descricao deve possuir no máximo $max caracteres.');
    }
  }

//endereco ? seja obrigatório, tenha no mínimo 3 caracteres e no máximo 50
  validateEndereco(String endereco) {
    var min = 3;
    var max = 50;
    if (endereco == null) {
      throw new DomainLayerException('O endereco é obrigatório.');
    } else if (endereco.length < min) {
      throw new DomainLayerException(
          'O endereco deve possuir pelo menos $min caracteres.');
    } else if (endereco.length > max) {
      throw new DomainLayerException(
          'O endereco deve possuir no máximo $max caracteres.');
    }
  }

//idproprietario ? seja obrigatório, tenha no mínimo 3 caracteres e no máximo 50
  validateIdproprietario(int idproprietario) {
    if (idproprietario == null) {
      throw new DomainLayerException('O idproprietario é obrigatório.');
    }
  }

//status ? seja obrigatório, tenha no mínimo 3 caracteres e no máximo 50
  validateStatus(int status) {
    if (status == null) {
      throw new DomainLayerException('O status é obrigatório.');
    }
  }

  validateIdimovelcategoria(int idimovelcategoria) {
    if (idimovelcategoria == null) {
      throw new DomainLayerException('A categoria é obrigatória.');
    }
  }
}
