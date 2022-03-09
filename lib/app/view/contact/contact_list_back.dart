import '../../../app/domain/entities/contact.dart';
import '../../../app/domain/services/contact_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'contact_list_back.g.dart';

class ContactListBack = _ContactListBack with _$ContactListBack;

abstract class _ContactListBack with Store {
  var _service = GetIt.I.get<ContactService>();

  //lista de contatos
  @observable
  Future<List<Contact>> list;

  @observable
  Future<List<Contact>> dadosImovel;

  //método para atualizar a lista de contatos
  @action
  refreshList([dynamic value]) {
    list = _service.find();
  }

  _ContactListBack() {
    refreshList();
  }

  //método para chamar o form salvar/alterar
  goToForm(BuildContext context, [Contact contact]) {
    Navigator.of(context)
        .pushNamed('/ContatosForm', arguments: contact)
        .then(refreshList);
  }

  //método para chamar o form salvar/alterar
  goToFormPagto(BuildContext context, [Contact contact]) {
    Navigator.of(context)
        .pushNamed('/Pagamentos', arguments: contact)
        .then(refreshList);
  }

  goToDetails(BuildContext context, Contact contact) {
    Navigator.of(context).pushNamed('/ContatosDetail', arguments: contact);
  }

  //excluir
  remove(dynamic id, BuildContext context) async {
    await _service.remove(id);
    refreshList();
    Navigator.of(context).pop();
  }
}
