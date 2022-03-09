import 'package:controlealuguel/app/domain/services/pessoas_wrap_service.dart';
import 'package:controlealuguel/src/states/pessoawrap_state.dart';
import 'package:flutter/material.dart';

class PessoaWrapStore extends ValueNotifier<PessoaWrapState> {
  final PessoasWrapService srvWrap;
  //PessoaStore(List<Pessoas> value) : super(value);
  PessoaWrapStore(this.srvWrap) : super(InitialPessoaWrapState());
  Future fetchPessoa() async {
    value = LoadingPessoaWrapState();
    try {
      final pessoaswrap = await srvWrap.find();
      value = SucessPessoaWrapState(pessoaswrap);
    } catch (e) {
      value = ErrorPessoaWrapState(e.toString());
    }
  }
}
