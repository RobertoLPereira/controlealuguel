import 'package:controlealuguel/app/view/apoio/categoria/categoria_de_imoveis_details.dart';
import 'package:controlealuguel/app/view/apoio/categoria/categoria_de_imoveis_form.dart';
import 'package:controlealuguel/app/view/apoio/categoria/teste/categoria_de_imoveis_form_list.dart';
import 'package:controlealuguel/app/view/apoio/faixaconsumo/faixadeconsumo_detail.dart';
import 'package:controlealuguel/app/view/apoio/faixaconsumo/faixadeconsumoform.dart';
import 'package:controlealuguel/app/view/apoio/faixaconsumo/list_faixadeconsumo.dart';
import 'package:controlealuguel/app/view/apoio/naturezarelacionamento/natrelac_details.dart';
import 'package:controlealuguel/app/view/apoio/naturezarelacionamento/natrelac_form.dart';
import 'package:controlealuguel/app/view/apoio/naturezarelacionamento/natrelac_list.dart';
import 'package:controlealuguel/app/view/bens/imovel_list.dart';
import 'package:controlealuguel/app/view/bens/imovelunidade_list.dart';
import 'package:controlealuguel/app/view/imovel/alugar_unidade_imovel_form.dart';
import 'package:controlealuguel/app/view/imovel/imovel_detail.dart';
import 'package:controlealuguel/app/view/imovel/listleituraaguaunidade.dart';
import 'package:controlealuguel/app/view/imovel/unidade_imovel_form.dart';
import 'package:controlealuguel/app/view/pagamento/form_pagamento.dart';
import 'package:controlealuguel/app/view/pagamento/pgpessoa_list.dart';
import 'package:controlealuguel/app/view/pessoas/pessoas_details.dart';
import 'package:controlealuguel/app/view/pessoas/pessoas_form.dart';
import 'package:controlealuguel/app/view/pessoas/pessoas_list.dart';
import 'package:controlealuguel/comboAninhado/views/home_page.dart';
import 'package:controlealuguel/src/pages/imovel/form_imovel.dart';
import 'package:controlealuguel/src/pages/imovel/form_leituraunidade.dart';
import 'package:controlealuguel/src/pages/pessoas/pessoa_list.dart';
import '../../../app/view/apoio/status/status_details.dart';
import '../../../app/view/apoio/status/status_form.dart';
import '../../../app/view/apoio/status/status_list.dart';

import '../../../app/view/contact/contact_details.dart';
import '../../../app/view/contact/contact_form.dart';
import '../../../nomedasrotas.dart';
import '../../../src/api/teste/mock_client.dart';
import 'package:flutter/material.dart';

import '../../../widget_tree.dart';
import 'autofill.dart';
import 'combobox_page.dart';
import 'form_widgets.dart';
import 'sign_in_http.dart';

class Demo {
  final String name;
  final String route;
  final WidgetBuilder builder;

  const Demo({this.name, this.route, this.builder});
}

final demos = [
  Demo(
    name: 'Combo',
    route: '/HomePage',
    builder: (context) => HomePage(),
  ),
  Demo(
    name: 'Pessoas',
    route: '/Pessoas',
    builder: (context) => PessoastList(),
  ),
  Demo(
    name: 'Pessoass-Form',
    route: '/PessoasForm',
    builder: (context) => PessoasForm(),
  ),
  Demo(
    name: 'Pessoas-Detail',
    route: '/PessoasDetail',
    builder: (context) => PessoasDetails(),
  ),
  Demo(
    name: 'Imoveis',
    route: '/Imoveis',
    builder: (context) => ImovelList(),
  ),
  Demo(
    name: 'Imovel',
    route: '/Imovel-Form',
    builder: (context) => ImovelForm(),
  ),
  Demo(
    name: 'Imovel Detalhes',
    route: '/Imovel-Detail',
    builder: (context) => ImovelDetails(),
  ),
  Demo(
    name: 'Imovel Unidades',
    route: '/Unidades',
    builder: (context) => ImovelUnidadeList(),
  ),
  Demo(
    name: 'Manter Unidade',
    route: '/Unidade-Form',
    builder: (context) => UnidadeImovelForm(),
  ),
  Demo(
    name: 'Alugar Unidade',
    route: '/Alugar-Form',
    builder: (context) => AlugarUnidadeImovelForm(),
  ),
  Demo(
    name: 'Pagamento',
    route: '/Pagamentos',
    builder: (context) => FormPagamento(),
  ),
  Demo(
    name: 'Pagamentos-List',
    route: '/PagamentosPessoa',
    builder: (context) => PgPessoaList(),
  ),
  Demo(
    name: 'Contatos',
    route: '/Contatos',
    builder: (context) => PessoaList(),
  ),
  Demo(
    name: 'Contatos-Form',
    route: '/ContatosForm',
    builder: (context) => ContactForm(),
  ),
  Demo(
    name: 'Contatos-Detail',
    route: '/ContatosDetail',
    builder: (context) => ContactDetails(),
  ),
  Demo(
    name: 'Categoria de Imoveis',
    route: '/Categorias',
    builder: (context) => CategoriaFormList(), //CategoriadeImoveisList(),
  ),
  Demo(
    name: 'Editar Categoria de Imoveis',
    route: '/form-categorias',
    builder: (context) => CategoriaForm(),
  ),
  Demo(
    name: 'Mostrar Categoria de Imoveis',
    route: '/detail-categorias',
    builder: (context) => CategoriasDetails(),
  ),
  Demo(
    name: 'DashBoard',
    route: '/DashBoard',
    builder: (context) => WidgetTree(),
  ),
  Demo(
    name: 'Sign in with HTTP',
    route: '/signin_http',
    builder: (context) => SignInHttpDemo(
      // This sample uses a mock HTTP client.
      httpClient: mockClient,
    ),
  ),
  Demo(
    name: 'Autofill',
    route: '/autofill',
    builder: (context) => const AutofillDemo(),
  ),
  Demo(
    name: 'Form widgets',
    route: '/form_widgets',
    builder: (context) => const FormWidgetsDemo(),
  ),
  Demo(
    name: 'Situações',
    route: NomedasRotas.STATUS,
    builder: (context) => StatusList(),
  ),
  Demo(
    name: 'Editar Situações',
    route: NomedasRotas.STATUSFORM,
    builder: (context) => StatusForm(),
  ),
  Demo(
    name: 'Detalhes da Situação',
    route: NomedasRotas.STATUSDET,
    builder: (context) => StatusDetails(),
  ),
  Demo(
    name: 'Nat. Relacionamento',
    route: NomedasRotas.NATRELAC,
    builder: (context) => NatRelacList(),
  ),
  Demo(
    name: 'Editar Nat. Relacionamento',
    route: NomedasRotas.NATRELACFORM,
    builder: (context) => NatRelacForm(),
  ),
  Demo(
    name: 'Detalhes Nat. Relacionamento',
    route: NomedasRotas.NATRELACDET,
    builder: (context) => NatRelacDetails(),
  ),
  Demo(
      name: 'Teste de ComboBox',
      route: NomedasRotas.COMBOBOX,
      builder: (context) => ComboboxPage()),
  Demo(
      builder: (context) => ListFaixadeconsumo(), //FaixaConsumoFormList(),
      name: 'Faixa de Consumo',
      route: NomedasRotas.FAIXADECONSUMO),
  Demo(
      builder: (context) => FaixadeconsumoForm(), //FaixaConsumoFormList(),
      name: 'Manter Faixa de Consumo',
      route: NomedasRotas.FAIXADECONSUMO_FORM),
  Demo(
      builder: (context) => FaixadeconsumoDetails(), //FaixaConsumoFormList(),
      name: 'Detalhes Faixa de Consumo',
      route: NomedasRotas.FAIXADECONSUMO_DETAIL),
  Demo(
      builder: (context) => ListLeituraaguaunidade(), //FaixaConsumoFormList(),
      name: 'Lista Leitura de Água',
      route: NomedasRotas.LEITURAAGUAUNIDADE),
  Demo(
      builder: (context) =>
          FormLeituraUnidadeAgua(), //LeituraaguaunidadeForm(),
      name: 'Manter Leitura de Água',
      route: NomedasRotas.LEITURAAGUAUNIDADE_FORM),
  Demo(
      builder: (context) => FaixadeconsumoDetails(), //FaixaConsumoFormList(),
      name: 'Detalhes Leitura de Água',
      route: NomedasRotas.LEITURAAGUAUNIDADE_DETAILS),
];
