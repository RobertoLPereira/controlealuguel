import 'package:controlealuguel/src/models/bens/imovel.dart';
import 'package:controlealuguel/src/models/bens/imovelWrap.dart';
import 'package:controlealuguel/src/models/bens/imovelunidade.dart';

abstract class ImovelWrapDAO {
  Future<List<ImovelWrap>> find();
  Future<List<Imovelunidade>> listar(dynamic idimovel);
  save(Imovel imovel);
  remove(dynamic id);
  reativar(dynamic id);
}
