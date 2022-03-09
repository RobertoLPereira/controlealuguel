import 'package:controlealuguel/src/models/bens/leituraaguaunidade.dart';

abstract class LeituraaguaunidadeInterface {
  save(LeituraAguaUnidade leituraaguaunidade);

  remove(dynamic id);

  Future<List<LeituraAguaUnidade>> find();
  //uso de chamada REST
}
