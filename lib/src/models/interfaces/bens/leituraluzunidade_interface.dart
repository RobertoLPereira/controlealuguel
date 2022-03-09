import '../../../../src/models/bens/leituraluzunidade.dart';

abstract class LeituraluzunidadeDAO {
  save(Leituraluzunidade leituraluzunidade);

  remove(dynamic id);

  Future<List<Leituraluzunidade>> find();
  //uso de chamada REST

  Future<List<Leituraluzunidade>> buscarLeituraluzunidade();
}
