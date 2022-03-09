// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'status_list_back.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StatusListBack on _StatusListBack, Store {
  final _$listAtom = Atom(name: '_StatusListBack.list');

  @override
  Future<List<Status>> get list {
    _$listAtom.reportRead();
    return super.list;
  }

  @override
  set list(Future<List<Status>> value) {
    _$listAtom.reportWrite(value, super.list, () {
      super.list = value;
    });
  }

  final _$_StatusListBackActionController =
      ActionController(name: '_StatusListBack');

  @override
  dynamic refreshList([dynamic value]) {
    final _$actionInfo = _$_StatusListBackActionController.startAction(
        name: '_StatusListBack.refreshList');
    try {
      return super.refreshList(value);
    } finally {
      _$_StatusListBackActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
list: ${list}
    ''';
  }
}
