import '../../../src/models/bens/imovelunidade.dart';

abstract class ImovelUnidadeInterface {
  save(Imovelunidade imovelunidade);

  remove(dynamic id);

  Future<List<Imovelunidade>> find();
  //uso de chamada REST
}
