import 'package:controlealuguel/app/domain/exception/domain_layer_exception.dart';
import 'package:controlealuguel/app/domain/interfaces/pessoas_wrap_dao.dart';
import 'package:controlealuguel/src/models/pagamento/pagamentoPessoa.dart';
import 'package:controlealuguel/src/models/pessoas/pessoas_wrap.dart';
import 'package:get_it/get_it.dart';

class PessoasWrapService {
  var _dao = GetIt.I.get<PessoasWrapDAO>();
// tem que salvar um contato, ter a possibilidade de alterar e excluir e listar todos os contatos
  Future<List<PessoasWrap>> find() {
    return _dao.find();
  }

  Future<List<PagamentosPessoa>> listar(int idpessoa) {
    return _dao.listar(idpessoa);
  }

  remove(dynamic idpessoa) async {
    await _dao.remove(idpessoa);
  }

  ativar(dynamic idpessoa) async {
    await _dao.reativar(idpessoa);
  }

  save(PessoasWrap pessoasWrap) async {
    validateName(pessoasWrap.nome);
    validateEmail(pessoasWrap.email);
    validatePhone(pessoasWrap.telefone);
    await _dao.save(pessoasWrap);
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

// e-mail → seja obrigatório e tenha @
  validateEmail(String email) {
    if (email == null) {
      throw new DomainLayerException('O e-mail é obrigatório.');
    } else if (!email.contains('@')) {
      throw new DomainLayerException('O e-mail deve possuir @.');
    }
  }

// telefone → seja obrigatório e tenha o formato (99) 9 9999-9999
  validatePhone(String phone) {
    var format = RegExp(
        r'^\([1-9]{2}\) [9] [6-9]{1}[0-9]{3}\-[0-9]{4}$'); // (99) 9 9999-9999
    if (phone == null) {
      throw new DomainLayerException('O telefone é obrigatório.');
    } else if (!format.hasMatch(phone)) {
      throw new DomainLayerException(
          'Formato inválido. O formato deve ser (99) 9 9999-9999.');
    }
  }
}
