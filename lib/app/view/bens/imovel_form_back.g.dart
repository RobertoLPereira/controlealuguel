// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'imovel_form_back.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ImovelWrapFormBack on _ImovelWrapFormBack, Store {
  final _$listAtom = Atom(name: '_ImovelWrapFormBack.list');

  @override
  Future<List<Pessoas>> get list {
    _$listAtom.reportRead();
    return super.list;
  }

  @override
  set list(Future<List<Pessoas>> value) {
    _$listAtom.reportWrite(value, super.list, () {
      super.list = value;
    });
  }

  final _$pessoaSelectedAtom = Atom(name: '_ImovelWrapFormBack.pessoaSelected');

  @override
  Pessoas get pessoaSelected {
    _$pessoaSelectedAtom.reportRead();
    return super.pessoaSelected;
  }

  @override
  set pessoaSelected(Pessoas value) {
    _$pessoaSelectedAtom.reportWrite(value, super.pessoaSelected, () {
      super.pessoaSelected = value;
    });
  }

  final _$loadingPessoasAtom = Atom(name: '_ImovelWrapFormBack.loadingPessoas');

  @override
  bool get loadingPessoas {
    _$loadingPessoasAtom.reportRead();
    return super.loadingPessoas;
  }

  @override
  set loadingPessoas(bool value) {
    _$loadingPessoasAtom.reportWrite(value, super.loadingPessoas, () {
      super.loadingPessoas = value;
    });
  }

  final _$findProprietariosAsyncAction =
      AsyncAction('_ImovelWrapFormBack.findProprietarios');

  @override
  Future<List<Pessoas>> findProprietarios(int idproprietario) {
    return _$findProprietariosAsyncAction
        .run(() => super.findProprietarios(idproprietario));
  }

  final _$findPessoasAsyncAction =
      AsyncAction('_ImovelWrapFormBack.findPessoas');

  @override
  Future<List<Pessoas>> findPessoas() {
    return _$findPessoasAsyncAction.run(() => super.findPessoas());
  }

  final _$_ImovelWrapFormBackActionController =
      ActionController(name: '_ImovelWrapFormBack');

  @override
  dynamic refreshList([dynamic value]) {
    final _$actionInfo = _$_ImovelWrapFormBackActionController.startAction(
        name: '_ImovelWrapFormBack.refreshList');
    try {
      return super.refreshList(value);
    } finally {
      _$_ImovelWrapFormBackActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selectpessoa(Pessoas pessoa) {
    final _$actionInfo = _$_ImovelWrapFormBackActionController.startAction(
        name: '_ImovelWrapFormBack.selectpessoa');
    try {
      return super.selectpessoa(pessoa);
    } finally {
      _$_ImovelWrapFormBackActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
list: ${list},
pessoaSelected: ${pessoaSelected},
loadingPessoas: ${loadingPessoas}
    ''';
  }
}
