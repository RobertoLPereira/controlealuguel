// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'imovelunidade_list_back.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ImovelUnidadeListBack on _ImovelUnidadeListBack, Store {
  final _$listAtom = Atom(name: '_ImovelUnidadeListBack.list');

  @override
  Future<List<UnidadeImovel>> get list {
    _$listAtom.reportRead();
    return super.list;
  }

  @override
  set list(Future<List<UnidadeImovel>> value) {
    _$listAtom.reportWrite(value, super.list, () {
      super.list = value;
    });
  }

  final _$_ImovelUnidadeListBackActionController =
      ActionController(name: '_ImovelUnidadeListBack');

  @override
  dynamic refreshList([dynamic value]) {
    final _$actionInfo = _$_ImovelUnidadeListBackActionController.startAction(
        name: '_ImovelUnidadeListBack.refreshList');
    try {
      return super.refreshList(value);
    } finally {
      _$_ImovelUnidadeListBackActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
list: ${list}
    ''';
  }
}
