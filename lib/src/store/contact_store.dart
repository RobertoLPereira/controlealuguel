import 'package:flutter/material.dart';
import '../../../src/services/pessoas/contact_service.dart';
import '../../../src/states/pessoas/contact_state.dart';

class ContactStore extends ValueNotifier<ContactState> {
  final ContactService srvPessoa;
  //PessoaStore(List<Pessoas> value) : super(value);
  ContactStore(this.srvPessoa) : super(InitialContactState());
  Future fetchPessoa() async {
    value = LoadingContactState();
    try {
      final pessoas = await srvPessoa.fetchPessoas();
      value = SucessContactState(pessoas);
    } catch (e) {
      value = ErrorContactState(e.toString());
    }
  }
}
