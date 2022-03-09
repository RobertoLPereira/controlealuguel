import '../../../../src/models/apoio/taxaadministracao.dart';

abstract class TaxaadministracaoDAO {
  save(Taxaadministracao taxaadministracao);

  remove(dynamic id);

  Future<List<Taxaadministracao>> find();
  //uso de chamada REST

  Future<List<Taxaadministracao>> buscarTaxaadministracao();
}
