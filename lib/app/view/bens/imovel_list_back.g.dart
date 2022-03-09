// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'imovel_list_back.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ImovelListBack on _ImovelListBack, Store {
  final _$listAtom = Atom(name: '_ImovelListBack.list');

  @override
  Future<List<ImovelWrap>> get list {
    _$listAtom.reportRead();
    return super.list;
  }

  @override
  set list(Future<List<ImovelWrap>> value) {
    _$listAtom.reportWrite(value, super.list, () {
      super.list = value;
    });
  }

  final _$_ImovelListBackActionController =
      ActionController(name: '_ImovelListBack');

  @override
  dynamic refreshList([dynamic value]) {
    final _$actionInfo = _$_ImovelListBackActionController.startAction(
        name: '_ImovelListBack.refreshList');
    try {
      return super.refreshList(value);
    } finally {
      _$_ImovelListBackActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
list: ${list}
    ''';
  }
}
