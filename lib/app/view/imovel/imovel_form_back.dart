import 'package:controlealuguel/app/domain/entities/imovel.dart';
import 'package:controlealuguel/app/domain/services/imovel_service.dart';
import 'package:controlealuguel/src/models/pessoas/pessoas_wrap.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

//part 'imovel_form_back.g.dart';

class ImovelFormBack {
  Imovel imovel;
  var _service = GetIt.I.get<ImovelService>();
  var _serviceProp = GetIt.I.get<ImovelService>();
  bool _idimovelIsValid;
  bool _descricaoIsValid;
  bool _enderecoIsValid;
  bool _idproprietarioIsValid;
  bool _statusIsValid;
  bool _idimovelcategoriaIsValid;

  bool get isValid =>
      _idimovelIsValid &&
      _descricaoIsValid &&
      _enderecoIsValid &&
      _idproprietarioIsValid &&
      _statusIsValid &&
      _idimovelcategoriaIsValid;
  // diferenciar novo com alteração
  ImovelFormBack(BuildContext context) {
    print('cheguei');
    var parameter = ModalRoute.of(context).settings.arguments;
    imovel = (parameter == null) ? Imovel() : parameter;
  }

  //salvar
  save(BuildContext context) async {
    await _service.save(imovel);
    Navigator.of(context).pop();
  }

  Future<List<PessoasWrap>> buscarProprietario() async {
    return await _serviceProp.listarProprietarios();
  }

  //validações
  String validateIdimovel(int idimovel) {
    try {
      _service.validateIdimovel(idimovel);
      _idimovelIsValid = true;
      return null;
    } catch (e) {
      _idimovelIsValid = false;
      return e.toString();
    }
  }

  String validateDescricao(String descricao) {
    try {
      _service.validateDescricao(descricao);
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

  String validateIdproprietario(int idproprietario) {
    try {
      _service.validateIdproprietario(idproprietario);
      _idproprietarioIsValid = true;
      return null;
    } catch (e) {
      _idproprietarioIsValid = false;
      return e.toString();
    }
  }

  String validateStatus(int status) {
    try {
      _service.validateStatus(status);
      _statusIsValid = true;
      return null;
    } catch (e) {
      _statusIsValid = false;
      return e.toString();
    }
  }

  String validateIdimovelcategoria(int idimovelcategoria) {
    try {
      _service.validateIdimovelcategoria(idimovelcategoria);
      _idimovelcategoriaIsValid = true;
      return null;
    } catch (e) {
      _idimovelcategoriaIsValid = false;
      return e.toString();
    }
  }
}
