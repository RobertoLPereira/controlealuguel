import '../../../../src/models/bens/leituraaguaunidade.dart';

abstract class LeituraaguaunidadeDAO {
  save(LeituraAguaUnidade leituraaguaunidade);

  remove(dynamic id);

  Future<List<LeituraAguaUnidade>> find();
  //uso de chamada REST

  Future<List<LeituraAguaUnidade>> buscarLeituraaguaunidade();
}
