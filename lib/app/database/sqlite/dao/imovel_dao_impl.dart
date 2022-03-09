import 'package:sqflite/sqflite.dart';

import '../../../../app/domain/interfaces/imovel_interface.dart';

import '../../../../app/domain/entities/imovel.dart';
import '../connection.dart';

class ImovelDAOImpl implements ImovelInterface {
  Database _db;

  @override
  Future<List<Imovel>> find() async {
    _db = (await Connection.get());
    List<Map<String, dynamic>> resultado = await _db.query('imovel');
    List<Imovel> lista = List.generate(resultado.length, (i) {
      var imovel = resultado[i];
      return Imovel(
        idimovel: imovel['idimovel'],
        descricao: imovel['descricao'],
        endereco: imovel['endereco'],
        idproprietario: imovel['idproprietario'],
        status: imovel['status'],
        idimovelcategoria: imovel['idimovelcategoria'],
      );
    });

    return lista;
  }

  @override
  remove(dynamic id) async {
    _db = (await Connection.get());
    var sql = 'DELETE FROM imovel WHERE idimovel = ?';
    _db.rawDelete(sql, [id]);
  }

  @override
  save(Imovel imovel) async {
    _db = (await Connection.get());
    var sql;
    if (imovel.idimovel == null) {
      sql =
          'INSERT INTO imovel (idimovel,descricao,endereco,idproprietario,status,idimovelcategoria) VALUES (?,?,?,?,?,?)';
      _db.rawInsert(sql, [
        imovel.idimovel,
        imovel.descricao,
        imovel.endereco,
        imovel.idproprietario,
        imovel.status,
        imovel.idimovelcategoria
      ]);
    } else {
      sql = 'UPDATE imovel SET wset WHERE idimovel = ?';
      _db.rawUpdate(sql, [
        imovel.idimovel,
        imovel.descricao,
        imovel.endereco,
        imovel.idproprietario,
        imovel.status,
        imovel.idimovelcategoria
      ]);
    }
  }
}
