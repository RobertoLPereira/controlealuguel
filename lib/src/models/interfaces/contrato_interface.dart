import '../../../../src/models/contrato/contrato.dart';

abstract class ContratoDAO {
  save(Contrato contrato);

  remove(dynamic id);

  Future<List<Contrato>> find();
  //uso de chamada REST

  Future<List<Contrato>> buscarContrato();
}
