import 'package:controlealuguel/app/domain/entities/unidade_imovel.dart';
import 'package:controlealuguel/app/domain/exception/domain_layer_exception.dart';
import 'package:controlealuguel/src/models/interfaces/bens/imovelunidade_interface.dart';
import 'package:get_it/get_it.dart';

class UnidadeImovelService {
  //Manter a Unidade do imovel (Inclui/Alterar/Consulta e Excluir)
  var _interface = GetIt.I.get<ImovelUnidadeDAO>();
  //Incluir e alterar
  salvar(UnidadeImovel unid) async {
    print('Service =>');
    print(unid);
    validarDescricao(unid.descricao);
    validarCategoria(unid.idimovelcategoria);
    validarImovel(unid.idimovel);
    if (unid.status == 3) {
      validarLocatario(unid.idlocatario.toString());
    }
    await _interface.save(unid);
  }

  //Excluir logicamente uma unidade
  Desativar(dynamic idunidade) async {
    await _interface.remove(idunidade);
  }

  //Ativar uma unidade de imóvel
  Ativar(dynamic idunidade) async {
    await _interface.reativar(idunidade);
  }

  //Validar os dados antes de Incluir/Alterar
  validarDescricao(String desc) {
    var min = 3;
    var max = 50;
    if (desc == null) {
      throw new DomainLayerException('A descrição é obrigatória!');
    } else if (desc.length < min) {
      throw new DomainLayerException(
          'A descrição deve possuir pelo menos $min caracteres.');
    } else if (desc.length > max) {
      throw new DomainLayerException(
          'A descrição deve possuir no máximo $max caracteres.');
    }
  }

  validarImovel(String imovel) {
    if (imovel == null) {
      throw new DomainLayerException('O imovel é obrigatório!');
    }
  }

  validarLocatario(String locatario) {
    if (int.parse(locatario) == 0 || locatario == null) {
      throw new DomainLayerException('O locatário é obrigatório!');
    }
  }

  validarCategoria(String categoria) {
    var min = 1;
    var max = 2;
    if (categoria == null) {
      throw new DomainLayerException('a categoria é obrigatória!');
    } else if (categoria.length < min) {
      throw new DomainLayerException(
          'A categoria do locatário deve possuir pelo menos $min caracteres.');
    } else if (categoria.length > max) {
      throw new DomainLayerException(
          'A categoria do locatário deve possuir no máximo $max caracteres.');
    }
  }
}
