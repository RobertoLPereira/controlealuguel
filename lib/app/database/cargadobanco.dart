const String inserirStatus =
    """INSERT INTO public.status (idstatus, denominacao) VALUES (1, 'Ativo');
INSERT INTO public.status (idstatus, denominacao) VALUES (2, 'Desativado');
INSERT INTO public.status (idstatus, denominacao) VALUES (3, 'Alugado');
INSERT INTO public.status (idstatus, denominacao) VALUES (4, 'Disponível');
INSERT INTO public.status (idstatus, denominacao) VALUES (5, 'Em Reforma');
INSERT INTO public.status (idstatus, denominacao) VALUES (6, 'Interditado');
INSERT INTO public.status (idstatus, denominacao) VALUES (7, 'Pago');
INSERT INTO public.status (idstatus, denominacao) VALUES (8, 'Pendente');
""";
const String naturezaRelacionamento =
    """INSERT INTO public.naturezarelacionamento (id, denominacao) VALUES (1, 'Administrador');
INSERT INTO public.naturezarelacionamento (id, denominacao) VALUES (2, 'Arrendamento');
INSERT INTO public.naturezarelacionamento (id, denominacao) VALUES (3, 'Locatário');
INSERT INTO public.naturezarelacionamento (id, denominacao) VALUES (4, 'Proprietário');
INSERT INTO public.naturezarelacionamento (id, denominacao) VALUES (5, 'Zelador');
""";
const String categoriadeimoveis =
    """INSERT INTO public.categoriadeimoveis (idcategoriadeimoveis, denominacao) VALUES (1, 'Residencial');
INSERT INTO public.categoriadeimoveis (idcategoriadeimoveis, denominacao) VALUES (2, 'Comercial ');
INSERT INTO public.categoriadeimoveis (idcategoriadeimoveis, denominacao) VALUES (3, 'Industrial ');
INSERT INTO public.categoriadeimoveis (idcategoriadeimoveis, denominacao) VALUES (4, 'Publica ');
INSERT INTO public.categoriadeimoveis (idcategoriadeimoveis, denominacao) VALUES (5, 'Residencial social ');
 """;
const String faixadeconsumo =
    """INSERT INTO public.faixadeconsumo (idfaixadeconsumo, denominacao, faixainicial, faixafinal, tarifaagua, tarifaesgoto, "tfdi", idcategoriadeimoveis) VALUES (1, 'Zero a 10m3         ', 0, 10, 1.96, 1.8, 29.49, 1);
INSERT INTO public.faixadeconsumo (idfaixadeconsumo, denominacao, faixainicial, faixafinal, tarifaagua, tarifaesgoto, "tfdi", idcategoriadeimoveis) VALUES (2, 'de 11 a 25 
m3      ', 11, 25, 9.11, 1.8, 29.49, 1);
INSERT INTO public.faixadeconsumo (idfaixadeconsumo, denominacao, faixainicial, faixafinal, tarifaagua, tarifaesgoto, "tfdi", idcategoriadeimoveis) VALUES (3, 'de 26 a 50 m3       ', 26, 50, 12.18, 1.8, 29.49, 1);
INSERT INTO public.faixadeconsumo (idfaixadeconsumo, denominacao, faixainicial, faixafinal, tarifaagua, tarifaesgoto, "tfdi", idcategoriadeimoveis) VALUES (4, 'de 31 a 50m3        ', 31, 50, 3.72, 1.8, NULL, 2);
INSERT INTO public.faixadeconsumo (idfaixadeconsumo, denominacao, faixainicial, faixafinal, tarifaagua, tarifaesgoto, "tfdi", idcategoriadeimoveis) VALUES (5, 'Acima de 50m3       ', 51, 999, 4.45, 1.8, NULL, 2);
""";
const String inserirPessoas =
    """INSERT INTO public.pessoas (idpessoa, nome, telefone, proprietario, cadastradoem, status) VALUES (1, 'Douglas Amorim Pereira  ', '5548988035236', true, '2021-12-03', 1);
INSERT INTO public.pessoas (idpessoa, nome, telefone, proprietario, cadastradoem, status) VALUES (2, 'Guilherme 'NULL, false, '2021-12-03', 1);
INSERT INTO public.pessoas (idpessoa, nome, telefone, proprietario, cadastradoem, status) VALUES (3, 'Robson     ', NULL, false, '2021-12-03', 1);
INSERT INTO public.pessoas (idpessoa, nome, telefone, proprietario, cadastradoem, status) VALUES (4, 'Iasmim     ', NULL, false, '2021-12-03', 1);
INSERT INTO public.pessoas (idpessoa, nome, telefone, proprietario, cadastradoem, status) VALUES (5, 'Fernanda    ', NULL, false, '2021-12-03', 1);
INSERT INTO public.pessoas (idpessoa, nome, telefone, proprietario, cadastradoem, status) VALUES (6, 'Carine     ', NULL, false, '2021-12-03', 1);
INSERT INTO public.pessoas (idpessoa, nome, telefone, proprietario, cadastradoem, status) VALUES (7, 'Laura        ', NULL, false, '2021-12-03', 1);
INSERT INTO public.pessoas (idpessoa, nome, telefone, proprietario, cadastradoem, status) VALUES (8, 'Fulano de Tal  ', NULL, true, '2021-12-04', 1);
INSERT INTO public.pessoas (idpessoa, nome, telefone, proprietario, cadastradoem, status) VALUES (9, 'Thiago Amorim Pereira ', '5548991478661 ', false, '2021-12-04', 1);
""";
const String inserirImoveis =
    """INSERT INTO public.imovel (idimovel, descricao, endereco, idproprietario, status) VALUES (1, 'KitNets do Saco Grande', 'Rua da Apicultura , 415 - Saco Grande                                                               ', 1, NULL);
INSERT INTO public.imovel (idimovel, descricao, endereco, idproprietario, status) VALUES (2, 'Apartamentos dos Inglesses', 'servidão silvei,96 inclesses                                                                        ', 1, NULL);
INSERT INTO public.imovel (idimovel, descricao, endereco, idproprietario, status) VALUES (3, 'KitNets do Rio Tavares ', 'SC 405 - 2099 - Rio Tavares                                                                         ', 1, NULL);
INSERT INTO public.imovel (idimovel, descricao, endereco, idproprietario, status) VALUES (4, 'Apartamentos Arrendados ', NULL, 8, NULL);
""";
const String inserirUnidadeImoveis =
    """INSERT INTO public.imovelunidade (idunidade, idimovel, idlocatario, descricao, status, idimovelcategoria) VALUES (1, 2, 2, 'Apartamento Nº 1', 1, 1);
INSERT INTO public.imovelunidade (idunidade, idimovel, idlocatario, descricao, status, idimovelcategoria) VALUES (2, 2, 3, 'Apartamento Nº2', 1, 1);
INSERT INTO public.imovelunidade (idunidade, idimovel, idlocatario, descricao, status, idimovelcategoria) VALUES (3, 2, 4, 'Apartamento Nº3', 1, 1);
INSERT INTO public.imovelunidade (idunidade, idimovel, idlocatario, descricao, status, idimovelcategoria) VALUES (4, 2, 5, 'Apartamento Nº4', 1, 1);
INSERT INTO public.imovelunidade (idunidade, idimovel, idlocatario, descricao, status, idimovelcategoria) VALUES (5, 2, 6, 'Apartamento Nº5', 1, 1);
INSERT INTO public.imovelunidade (idunidade, idimovel, idlocatario, descricao, status, idimovelcategoria) VALUES (6, 2, 7, 'Apartamento Nº6', 1, 1);
""";

const String inserirContratos =
    """INSERT INTO public.contrato (idcontrato, idunidadeimovel, idlocador, idlocatario, diavencimento, datacontrato, status, validadecontrato, valor, taxacondominio, valordecaucao) VALUES (1, 1, 9, 2, 10, '2021-11-01', 1, '2022-11-10', 950, NULL, NULL);
INSERT INTO public.contrato (idcontrato, idunidadeimovel, idlocador, idlocatario, diavencimento, datacontrato, status, validadecontrato, valor, taxacondominio, valordecaucao) VALUES (2, 2, 9, 3, 1, '2021-11-01', 1, '2022-11-10', 950, NULL, NULL);
INSERT INTO public.contrato (idcontrato, idunidadeimovel, idlocador, idlocatario, diavencimento, datacontrato, status, validadecontrato, valor, taxacondominio, valordecaucao) VALUES (3, 3, 9, 4, 2, '2021-11-01', 1, '2022-11-10', 950, NULL, NULL);
INSERT INTO public.contrato (idcontrato, idunidadeimovel, idlocador, idlocatario, diavencimento, datacontrato, status, validadecontrato, valor, taxacondominio, valordecaucao) VALUES (4, 4, 9, 5, 10, '2021-11-01', 1, '2022-11-10', 950, NULL, NULL);
INSERT INTO public.contrato (idcontrato, idunidadeimovel, idlocador, idlocatario, diavencimento, datacontrato, status, validadecontrato, valor, taxacondominio, valordecaucao) VALUES (5, 5, 9, 6, 10, '2021-11-01', 1, '2022-11-10', 950, NULL, NULL);
INSERT INTO public.contrato (idcontrato, idunidadeimovel, idlocador, idlocatario, diavencimento, datacontrato, status, validadecontrato, valor, taxacondominio, valordecaucao) VALUES (6, 6, 9, 7, 10, '2021-11-01', 1, '2022-11-10', 950, NULL, NULL);
""";

const String inserirVinculos =
    """INSERT INTO public.vinculos (idvinculo, idnaturezarelac, idpessoa, inicio, fim, idimovel) VALUES (1, 4, 1, '2021-12-04', NULL, 2);
INSERT INTO public.vinculos (idvinculo, idnaturezarelac, idpessoa, inicio, fim, idimovel) VALUES (2, 1, 9, '2021-12-04', NULL, 2);
INSERT INTO public.vinculos (idvinculo, idnaturezarelac, idpessoa, inicio, fim, idimovel) VALUES (3, 8, 8, '2021-11-01', NULL, 4);
INSERT INTO public.vinculos (idvinculo, idnaturezarelac, idpessoa, inicio, fim, idimovel) VALUES (4, 1, 1, '2021-12-04', NULL, 4);
INSERT INTO public.vinculos (idvinculo, idnaturezarelac, idpessoa, inicio, fim, idimovel) VALUES (5, 1, 9, '2021-12-04', NULL, 4);
""";
