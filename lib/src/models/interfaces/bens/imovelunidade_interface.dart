import 'package:controlealuguel/app/domain/entities/unidade_imovel.dart';

abstract class ImovelUnidadeDAO {
  save(UnidadeImovel imovelunidade);

  remove(dynamic id);
  reativar(dynamic id);
  Future<List<UnidadeImovel>> find();
  //uso de chamada REST

  Future<List<UnidadeImovel>> buscarImovelunidade();
}
