import '../bens/leituraaguaunidade.dart';

abstract class LeituraDeConsumoInterface {
  save(LeituraAguaUnidade leituradeconsumo);

  remove(dynamic id);

  Future<List<LeituraAguaUnidade>> find();
  //uso de chamada REST

  Future<List<LeituraAguaUnidade>> buscarLeituraaguaunidade();
}
