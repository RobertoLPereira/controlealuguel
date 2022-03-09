import '../../../../src/models/apoio/centrocusto.dart';

abstract class CentrocustoDAO {
  save(Centrocusto centrocusto);

  remove(dynamic id);

  Future<List<Centrocusto>> find();
  //uso de chamada REST

  Future<List<Centrocusto>> buscarCentrocusto();
}
