import 'package:controlealuguel/src/models/bens/imovel.dart';
import 'package:controlealuguel/src/models/bens/imovelWrap.dart';
import 'package:controlealuguel/src/models/bens/imovelunidade.dart';
import 'package:controlealuguel/src/models/pessoas/pessoas.dart';

abstract class ImovelDAO {
  Future<List<ImovelWrap>> find();
  Future<List<Imovelunidade>> listar(dynamic idimovel);
  Future<dynamic> save(ImovelWrap imovel);
  salvar(Imovel imovel);
  remove(dynamic id);
  reativar(dynamic id);
  Future<List<Pessoas>> getPessoasByProprietario(int idproprietario);
  Future<List<Pessoas>> getProrietarios();
}
