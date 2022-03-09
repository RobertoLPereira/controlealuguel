// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leituradeconsumo_list_back.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LeituraDeConsumoListBack on _LeituraDeConsumoListBack, Store {
  final _$listAtom = Atom(name: '_LeituraDeConsumoListBack.list');

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

  final _$_LeituraDeConsumoListBackActionController =
      ActionController(name: '_LeituraDeConsumoListBack');

  @override
  dynamic refreshList([dynamic value]) {
    final _$actionInfo = _$_LeituraDeConsumoListBackActionController
        .startAction(name: '_LeituraDeConsumoListBack.refreshList');
    try {
      return super.refreshList(value);
    } finally {
      _$_LeituraDeConsumoListBackActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
list: ${list}
    ''';
  }
}
