// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categoria_de_imoveis_back.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CategoriadeimoveisListBack on _CategoriadeimoveisListBack, Store {
  final _$listAtom = Atom(name: '_CategoriadeimoveisListBack.list');

  @override
  Future<List<Categorias>> get list {
    _$listAtom.reportRead();
    return super.list;
  }

  @override
  set list(Future<List<Categorias>> value) {
    _$listAtom.reportWrite(value, super.list, () {
      super.list = value;
    });
  }

  final _$_CategoriadeimoveisListBackActionController =
      ActionController(name: '_CategoriadeimoveisListBack');

  @override
  dynamic refreshList([dynamic value]) {
    final _$actionInfo = _$_CategoriadeimoveisListBackActionController
        .startAction(name: '_CategoriadeimoveisListBack.refreshList');
    try {
      return super.refreshList(value);
    } finally {
      _$_CategoriadeimoveisListBackActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
list: ${list}
    ''';
  }
}
