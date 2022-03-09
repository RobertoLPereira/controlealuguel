import '../../../../src/models/apoio/faixadeconsumo.dart';

abstract class FaixadeconsumoDAO {
  save(Faixadeconsumo faixadeconsumo);

  remove(dynamic id);

  Future<List<Faixadeconsumo>> find();
  //uso de chamada REST

  Future<List<Faixadeconsumo>> buscarFaixadeconsumo();
}
