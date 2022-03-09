import '../entities/status.dart';

abstract class StatusDAO {
  save(Status Status);

  remove(dynamic id);

  Future<List<Status>> find();
}
