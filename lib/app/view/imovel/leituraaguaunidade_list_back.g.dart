// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leituraaguaunidade_list_back.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LeituraaguaunidadeListBack on _LeituraaguaunidadeListBack, Store {
  final _$listAtom = Atom(name: '_LeituraaguaunidadeListBack.list');

  @override
  Future<List<LeituraAguaUnidade>> get list {
    _$listAtom.reportRead();
    return super.list;
  }

  @override
  set list(Future<List<LeituraAguaUnidade>> value) {
    _$listAtom.reportWrite(value, super.list, () {
      super.list = value;
    });
  }

  final _$_LeituraaguaunidadeListBackActionController =
      ActionController(name: '_LeituraaguaunidadeListBack');

  @override
  dynamic refreshList([dynamic value]) {
    final _$actionInfo = _$_LeituraaguaunidadeListBackActionController
        .startAction(name: '_LeituraaguaunidadeListBack.refreshList');
    try {
      return super.refreshList(value);
    } finally {
      _$_LeituraaguaunidadeListBackActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
list: ${list}
    ''';
  }
}
