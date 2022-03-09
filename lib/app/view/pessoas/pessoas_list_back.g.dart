// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pessoas_list_back.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PessoasListBack on _PessoasListBack, Store {
  final _$listAtom = Atom(name: '_PessoasListBack.list');

  @override
  Future<List<PessoasWrap>> get list {
    _$listAtom.reportRead();
    return super.list;
  }

  @override
  set list(Future<List<PessoasWrap>> value) {
    _$listAtom.reportWrite(value, super.list, () {
      super.list = value;
    });
  }

  final _$_PessoasListBackActionController =
      ActionController(name: '_PessoasListBack');

  @override
  dynamic refreshList([dynamic value]) {
    final _$actionInfo = _$_PessoasListBackActionController.startAction(
        name: '_PessoasListBack.refreshList');
    try {
      return super.refreshList(value);
    } finally {
      _$_PessoasListBackActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
list: ${list}
    ''';
  }
}
