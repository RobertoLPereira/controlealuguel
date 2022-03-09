import 'package:controlealuguel/app/domain/services/imovel_wrap_service.dart';
import 'package:controlealuguel/src/models/bens/imovelWrap.dart';
import 'package:controlealuguel/src/models/pessoas/pessoas.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'imovel_form_back.g.dart';

class ImovelWrapFormBack = _ImovelWrapFormBack with _$ImovelWrapFormBack;

abstract class _ImovelWrapFormBack with Store {
  ImovelWrap imovelWrap;
  var _service = GetIt.I.get<ImovelWrapService>();
  bool _descricaoIsValid;
  bool _enderecoIsValid;
  bool _proprietarioIsValid;

  bool get isValid =>
      _descricaoIsValid && _enderecoIsValid && _proprietarioIsValid;

  // diferenciar novo com alteração
  ImovelWrapFormBack(BuildContext context) {
    var parameter = ModalRoute.of(context).settings.arguments;
    imovelWrap = (parameter == null) ? ImovelWrap() : parameter;
  }

  //lista de contatos
  @observable
  Future<List<Pessoas>> list;

  //método para atualizar a lista de contatos
  @action
  refreshList([dynamic value]) {
    list = _service.getProrietarios();
  }

  _ImovelWrapFormBack() {
    refreshList();
  }
  //salvar
  save(BuildContext context) async {
    print(context);
    await _service.save(imovelWrap);
    Navigator.of(context).pop();
  }

  //validações
  String validateDescricao(String descricao) {
    try {
      _service.validateName(descricao);
      _descricaoIsValid = true;
      return null;
    } catch (e) {
      _descricaoIsValid = false;
      return e.toString();
    }
  }

  String validateEndereco(String endereco) {
    try {
      _service.validateEndereco(endereco);
      _enderecoIsValid = true;
      return null;
    } catch (e) {
      _enderecoIsValid = false;
      return e.toString();
    }
  }

  String validateProprietario(int id) {
    try {
      _service.validateProprietario(id);
      _proprietarioIsValid = true;
      return null;
    } catch (e) {
      _proprietarioIsValid = false;
      return e.toString();
    }
  }

  @observable
  Pessoas pessoaSelected;

  @observable
  bool loadingPessoas = false;

  @action
  void selectpessoa(Pessoas pessoa) {
    this.pessoaSelected = pessoa;
  }

  @action
  Future<List<Pessoas>> findProprietarios(int idproprietario) async {
    loadingPessoas = true;
    this.pessoaSelected = null;
    var Pessoas = await _service.getPessoasByProprietario(idproprietario);
    loadingPessoas = false;
    return Pessoas;
  }

  @action
  Future<List<Pessoas>> findPessoas() async {
    loadingPessoas = true;
    this.pessoaSelected = null;
    var Pessoas = await _service.getProrietarios();
    loadingPessoas = false;
    return Pessoas;
  }
}
