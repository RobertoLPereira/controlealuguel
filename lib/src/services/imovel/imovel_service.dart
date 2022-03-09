// ignore_for_file: unused_element

import '../../../app/domain/exception/domain_layer_exception.dart';
import '../../../src/models/bens/imovel.dart';
import '../../../src/models/interfaces/bens/imovel_interface.dart';
import 'package:get_it/get_it.dart';

class ImovelService {
  var _dao = GetIt.I.get<ImovelDAO>();
  var format = RegExp(
      r'^\([1-9]{2}\) [9] [6-9]{1}[0-9]{3}\-[0-9]{4}$'); // (99) 9 9999-9999
  // tem que salvar um imovel, ter a possibilidade de alterar e excluir e listar todos os contatos
  save(Imovel imovel) {}
  remove(dynamic id) {
    _dao.remove(id);
  }

  validateImovel(int idimovel) {
    if (idimovel == null) {
      throw new DomainLayerException('O idimovel é obrigatório.');
    }
//descricao ? seja obrigatório, tenha no mínimo 3 caracteres e no máximo 50
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
    validateIdproprietario(String idproprietario) {
      var min = 3;
      var max = 50;
      if (idproprietario == null) {
        throw new DomainLayerException('O idproprietario é obrigatório.');
      } else if (idproprietario.length < min) {
        throw new DomainLayerException(
            'O idproprietario deve possuir pelo menos $min caracteres.');
      } else if (idproprietario.length > max) {
        throw new DomainLayerException(
            'O idproprietario deve possuir no máximo $max caracteres.');
      }
    }

//status ? seja obrigatório, tenha no mínimo 3 caracteres e no máximo 50
    validateStatus(String status) {
      var min = 3;
      var max = 50;
      if (status == null) {
        throw new DomainLayerException('O status é obrigatório.');
      } else if (status.length < min) {
        throw new DomainLayerException(
            'O status deve possuir pelo menos $min caracteres.');
      } else if (status.length > max) {
        throw new DomainLayerException(
            'O status deve possuir no máximo $max caracteres.');
      }
    }

//idimovelcategoria ? seja obrigatório, tenha no mínimo 3 caracteres e no máximo 50
    validateIdimovelcategoria(String idimovelcategoria) {
      var min = 3;
      var max = 50;
      if (idimovelcategoria == null) {
        throw new DomainLayerException('O idimovelcategoria é obrigatório.');
      } else if (idimovelcategoria.length < min) {
        throw new DomainLayerException(
            'O idimovelcategoria deve possuir pelo menos $min caracteres.');
      } else if (idimovelcategoria.length > max) {
        throw new DomainLayerException(
            'O idimovelcategoria deve possuir no máximo $max caracteres.');
      }
    }
  }
}
