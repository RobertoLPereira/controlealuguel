// ignore_for_file: unused_import

import 'package:controlealuguel/app/api/imovel_rest_api.dart';
import 'package:controlealuguel/app/api/imovelunidade_rest_api.dart';
import 'package:controlealuguel/app/domain/interfaces/categoriadeimoveis_dao.dart';
import 'package:controlealuguel/app/domain/interfaces/imovel_interface.dart';
import 'package:controlealuguel/app/domain/services/imovel_wrap_service.dart';
import 'package:controlealuguel/src/api/apoio/faixadeconsumo_api.dart';
import 'package:controlealuguel/src/api/apoio/naturezarelacionamento_api.dart';
import 'package:controlealuguel/src/api/bens/imovel_api.dart';
import 'package:controlealuguel/src/api/bens/imovelunidade_api.dart';
import 'package:controlealuguel/src/api/contrato/pagamentos_api.dart';
import 'package:controlealuguel/src/api/pessoas/pessoaswrap_api.dart';
import 'package:controlealuguel/src/models/interfaces/apoio/naturezarelacionamento_interface.dart';
import 'package:controlealuguel/src/models/interfaces/bens/imovel_interface.dart';
import 'package:controlealuguel/src/models/interfaces/bens/imovelunidade_interface.dart';
import 'package:controlealuguel/src/models/modelonegocio/leitura_de_consumo.dart';
import 'package:controlealuguel/src/models/modelonegocio/leituradeconsumo_api.dart';
import 'package:controlealuguel/src/models/modelonegocio/leituradeconsumo_interface.dart';
import 'package:controlealuguel/src/models/modelonegocio/leituradeconsumo_service.dart';
import 'package:uno/uno.dart';
import 'api/leituraaguaunidade_api.dart';
import 'api/pagamento_dao_postgres.dart';
import 'database/mysql/contact_dao_mysql.dart';
import '../../../app/domain/interfaces/contact_dao.dart';
import '../../../app/domain/services/contact_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'database/mysql/status_dao_mysql.dart';
import 'database/postgres/categoriadeimoveis_dao_mysql.dart';
import 'domain/interfaces/faixadeconsumo_interface.dart';
import 'domain/interfaces/imovelunidade_interface.dart';
import 'domain/interfaces/leituraaguaunidade_interface.dart';
import 'domain/interfaces/pagamento_dao.dart';
import 'domain/interfaces/pessoas_wrap_dao.dart';
import 'domain/interfaces/statust_dao.dart';
import 'domain/regrasdenegocio/services/unidade_imovel_service.dart';
import 'domain/services/categoriade_imoveis_service.dart';
import 'domain/services/faixa_de_consumo_service.dart';
import 'domain/services/leituraaguaunidade_service.dart';
import 'domain/services/naturezarelacionamento_service.dart';
import 'domain/services/pagamento_service.dart';
import 'domain/services/pessoas_wrap_service.dart';
import 'domain/services/status_service.dart';

setupInjection() async {
  GetIt getIt = GetIt.I;

  WidgetsFlutterBinding.ensureInitialized();
  Uno uno;
  getIt.registerSingleton<ContactDAO>(ContactDAOMySQL());
  getIt.registerSingleton<ContactService>(ContactService());
  getIt.registerSingleton<StatusDAO>(StatusDAOMySQL());
  getIt.registerSingleton<StatusService>(StatusService());
  getIt.registerSingleton<CategoriadeImoveisDAO>(CategoriadeImoveisDAOMySQL());
  getIt.registerSingleton<CategoriadeImoveisService>(
      CategoriadeImoveisService());
  getIt.registerSingleton<NaturezarelacionamentoDAO>(
      NaturezarelacionamentoApi(uno));
  getIt.registerSingleton<NatRelacService>(NatRelacService());
  getIt.registerSingleton<PagamentoDAO>(PagamentoDAOPostgres());
  getIt.registerSingleton<PagamentoService>(PagamentoService());
  getIt.registerSingleton<PagamentosApi>(PagamentosApi(uno));
  getIt.registerSingleton<PessoasWrapDAO>(PessoasWrapApi(uno));
  getIt.registerSingleton<PessoasWrapService>(PessoasWrapService());
  getIt.registerSingleton<ImovelDAO>(ImovelApi(uno));
  getIt.registerSingleton<ImovelInterface>(ImovelRestApi(uno));
  getIt.registerSingleton<ImovelWrapService>(ImovelWrapService());
  getIt.registerSingleton<ImovelUnidadeDAO>(ImovelunidadeApi(uno));
  getIt.registerSingleton<UnidadeImovelService>(UnidadeImovelService());
  getIt.registerSingleton<LeituraaguaunidadeInterface>(
      LeituraaguaunidadeApi(uno));
  getIt.registerSingleton<LeituraaguaunidadeService>(
      LeituraaguaunidadeService());
  getIt.registerSingleton<FaixadeconsumoInterface>(FaixadeconsumoApi(uno));
  getIt.registerSingleton<FaixadeconsumoService>(FaixadeconsumoService());
  getIt.registerSingleton<LeituraDeConsumoInterface>(LeituraDeConsumoApi());
  getIt.registerSingleton<LeituradeConsumoService>(LeituradeConsumoService());
}
