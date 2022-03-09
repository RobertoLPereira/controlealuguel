// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'natrelac_list_back.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NatRelacListBack on _NatRelacListBack, Store {
  final _$listAtom = Atom(name: '_NatRelacListBack.list');

  @override
  Future<List<Naturezarelacionamento>> get list {
    _$listAtom.reportRead();
    return super.list;
  }

  @override
  set list(Future<List<Naturezarelacionamento>> value) {
    _$listAtom.reportWrite(value, super.list, () {
      super.list = value;
    });
  }

  final _$_NatRelacListBackActionController =
      ActionController(name: '_NatRelacListBack');

  @override
  dynamic refreshList([dynamic value]) {
    final _$actionInfo = _$_NatRelacListBackActionController.startAction(
        name: '_NatRelacListBack.refreshList');
    try {
      return super.refreshList(value);
    } finally {
      _$_NatRelacListBackActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
list: ${list}
    ''';
  }
}
