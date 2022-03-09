import '../../../../src/models/pessoas/vinculos.dart';

abstract class VinculosDAO {
  save(Vinculos vinculos);

  remove(dynamic id);

  Future<List<Vinculos>> find();
  //uso de chamada REST

  Future<List<Vinculos>> buscarVinculos();
}
