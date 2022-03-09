const String getAlugueisemdia = """SELECT count(*) AS emdia,
    sum(c.valor) AS sum
   FROM public.contrato c
  WHERE (((c.diavencimento)::double precision > ( SELECT date_part('Day'::text, CURRENT_DATE) AS date_part)) AND (EXISTS ( SELECT p.idcontrato
           FROM public.pagamentos p
          WHERE (( SELECT date_part('Month'::text, p.datapagamento) AS date_part) = ( SELECT date_part('Month'::text, CURRENT_DATE) AS date_part)))));
""";
const String getQuantidadeimoveis = """
 SELECT i.idimovel,
    ( SELECT count(iu.*) AS unidades
           FROM public.imovelunidade iu
          WHERE (iu.idimovel = i.idimovel)) AS unidades
   FROM public.imovel i""";
//consulta faixa de consumo
const String getFaixadeconsumo =
    """select iu.idlocatario,iu.descricao,p.nome,fc.* from imovelunidade iu
left join pessoas p on p.idpessoa=iu.idlocatario
left join faixadeconsumo fc on fc.idcategoriadeimoveis=iu.idimovelcategoria""";
//vw_alugueis_emdia
const String vw_alugueis_emdia =
    //Centro de custo
    """SELECT count(*) AS emdia,
    sum(c.valor) AS sum
   FROM public.contrato c
  WHERE (((c.diavencimento)::double precision > ( SELECT date_part('Day'::text, CURRENT_DATE) AS date_part)) AND (EXISTS ( SELECT p.idcontrato
           FROM public.pagamentos p
          WHERE (( SELECT date_part('Month'::text, p.datapagamento) AS date_part) = ( SELECT date_part('Month'::text, CURRENT_DATE) AS date_part)))));
""";
//vw_alugueis_vencidos
const String vw_alugueis_vencidos = """
 SELECT count(*) AS vencidos,
    sum(c.valor) AS sum
   FROM public.contrato c
  WHERE (((c.diavencimento)::double precision < ( SELECT date_part('Day'::text, CURRENT_DATE) AS date_part)) AND (EXISTS ( SELECT NULL::text AS text
           FROM public.pagamentos p
          WHERE (( SELECT date_part('Month'::text, p.datapagamento) AS date_part) = ( SELECT date_part('Month'::text, CURRENT_DATE) AS date_part)))));
          """;
//vw_contratos
const String vw_contratos = """SELECT count(*) AS ativos,
    sum(c.valor) AS sum,
    ( SELECT count(*) AS inativos
           FROM public.contrato ci
          WHERE (ci.status > 1)) AS inativos
   FROM public.contrato c
  WHERE (c.status = 1);""";
//vw_pagos_ematraso
const String vw_pagos_ematraso = """
 SELECT count(*) AS pagosematraso
   FROM (public.contrato c
     JOIN public.pagamentos p ON (((c.idcontrato = p.idcontrato) AND (( SELECT date_part('Day'::text, p.datapagamento) AS date_part) > (c.diavencimento)::double precision) AND (( SELECT date_part('Month'::text, p.datapagamento) AS date_part) = ( SELECT date_part('Month'::text, CURRENT_DATE) AS date_part)))));""";
//vw_pagos_emdia
const String vw_pagos_emdia = """
 SELECT count(*) AS pagosemdia,
    sum(c.valor) AS sum
   FROM (public.contrato c
     JOIN public.pagamentos p ON (((c.idcontrato = p.idcontrato) AND (( SELECT date_part('Day'::text, p.datapagamento) AS date_part) <= (c.diavencimento)::double precision) AND (( SELECT date_part('Month'::text, p.datapagamento) AS date_part) = ( SELECT date_part('Month'::text, CURRENT_DATE) AS date_part)))));""";
//vw_quantidade_imoveis
const String vw_quantidade_imoveis = """
 SELECT i.idimovel,
    ( SELECT count(iu.*) AS unidades
           FROM public.imovelunidade iu
          WHERE (iu.idimovel = i.idimovel)) AS unidades
   FROM public.imovel i""";
const String vw_unidadepagadora = """ 
  select c.*,un.*,im.* from contrato c 
left join imovelunidade un on un.idlocatario=c.idlocatario
left join imovel im on im.idimovel = un.idimovel
""";
const String vw_listacontatos = """ 
  select p.*,c.*,iu.descricao as unidade,
  (select im.descricao as imovel from imovel im where im.idimovel=iu.idimovel) ,
  (select im.endereco as enddereco from imovel im where im.idimovel=iu.idimovel) 
  from pessoas p 
  left join contrato c on p.idpessoa=c.idlocatario
  left join imovelunidade iu on iu.idlocatario=c.idlocatario""";

const String vw_listacontatosWrap = """ 
  select c.*,p.*,iu.descricao as unidade,
    (select im.descricao as imovel from imovel im where im.idimovel=iu.idimovel) ,
    (select im.endereco as enddereco from imovel im where im.idimovel=iu.idimovel) ,
    (select count(*) from pagamentos p where (((c.idcontrato = p.idcontrato) AND 
  	(( SELECT date_part('Year'::text, p.datapagamento) ) = (date_part('Year'::text, CURRENT_DATE) ) 
  	AND (( SELECT date_part('Month'::text, p.datapagamento)) = ( SELECT date_part('Month'::text, CURRENT_DATE) )))))
  	) as pago
    from pessoas p   
    left join contrato c on p.idpessoa=c.idlocatario
  left join imovelunidade iu on iu.idlocatario=c.idlocatario
""";
const String vw_pagamentosPessoa = """select pg.*,p.*,c.idlocatario 
from pagamentos pg left join  contrato c on c.idcontrato=pg.idcontrato 
left join pessoas p on p.idpessoa=c.idlocatario """;
const String vw_imoveilWrap =
    """select i.*,p.*,c.denominacao as categoria from imovel i left join pessoas p
     on p.idpessoa = i.idproprietario left join categoriadeimoveis c 
     on c.idcategoriadeimoveis=i.idimovelcategoria """;
