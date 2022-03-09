import '../../../app/domain/entities/imovel.dart';

abstract class ImovelInterface {
  save(Imovel imovel);

  remove(dynamic id);

  Future<List<Imovel>> find();
  //uso de chamada REST
}
