import '../../../../src/models/apoio/naturezarelacionamentos.dart';

abstract class NaturezarelacionamentoDAO {
  save(Naturezarelacionamento naturezarelacionamento);

  remove(dynamic id);

  Future<List<Naturezarelacionamento>> find();
}
