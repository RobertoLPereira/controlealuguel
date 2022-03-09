import 'dart:convert';

class GeraMvcFlutter {
  String table_name;
  String column_name;
  String is_nullable;
  String data_type;
  String character_maximum_length;
  String constraint_name;
  String model;
  String descricao;
  GeraMvcFlutter({
    this.table_name,
    this.column_name,
    this.is_nullable,
    this.data_type,
    this.character_maximum_length,
    this.constraint_name,
    this.model,
    this.descricao,
  });

  Map<String, dynamic> toMap() {
    return {
      'table_name': table_name,
      'column_name': column_name,
      'is_nullable': is_nullable,
      'data_type': data_type,
      'character_maximum_length': character_maximum_length,
      'constraint_name': constraint_name,
      'model': model,
      'descricao': descricao,
    };
  }

  factory GeraMvcFlutter.fromMap(Map<String, dynamic> map) {
    return GeraMvcFlutter(
      table_name: map['table_name'] ?? '',
      column_name: map['column_name'] ?? '',
      is_nullable: map['is_nullable'] ?? '',
      data_type: map['data_type'] ?? '',
      character_maximum_length: map['character_maximum_length'] ?? '',
      constraint_name: map['constraint_name'] ?? '',
      model: map['model'] ?? '',
      descricao: map['descricao'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory GeraMvcFlutter.fromJson(String source) =>
      GeraMvcFlutter.fromMap(json.decode(source));
}
