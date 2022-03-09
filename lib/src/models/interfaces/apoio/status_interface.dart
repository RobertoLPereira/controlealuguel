import '../../../../src/models/apoio/status.dart';

abstract class StatusDAO {
  save(Status status);

  remove(dynamic id);

  Future<List<Status>> find();
  //uso de chamada REST

  Future<List<Status>> buscarStatus();
}
