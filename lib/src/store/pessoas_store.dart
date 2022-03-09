import 'package:flutter/material.dart';
import '../../src/services/pessoas/pessoas_service.dart';
import '../../src/states/pessoa_state.dart';

class PessoaStore extends ValueNotifier<PessoaState> {
  final PessoaService srvPessoa;

  //PessoaStore(List<Pessoas> value) : super(value);
  PessoaStore(this.srvPessoa) : super(InitialPessoaState());
  Future fetchPessoa() async {
    value = LoadingPessoaState();
    try {
      final pessoas = await srvPessoa.fetchPessoas();
      value = SucessPessoaState(pessoas);
    } catch (e) {
      value = ErrorPessoaState(e.toString());
    }
  }
}
