//vw_dashboard
const String vw_dashboard = """ SELECT  Coalesce(count(*),0) AS ativos,
    Coalesce(sum(c.valor),0) AS valortotalcontrato,
    Coalesce(( SELECT count(*) AS inativos
           FROM contrato ci
          WHERE ci.status > 1),0) AS inativos,
    Coalesce(( SELECT sum(c_1.valor) AS vencidos
           FROM contrato c_1
          WHERE c_1.diavencimento::double precision < (( SELECT date_part('Day'::text, CURRENT_DATE) AS date_part)) AND (EXISTS ( SELECT NULL::text AS text
                   FROM pagamentos p
                  WHERE (( SELECT date_part('Month'::text, p.datapagamento) AS date_part)) = (( SELECT date_part('Month'::text, CURRENT_DATE) AS date_part))))),
0) AS vencidos,
    Coalesce(( SELECT sum(p.valorpago - p.desconto) AS pagosematraso
           FROM contrato c_1
             JOIN pagamentos p ON c_1.idcontrato = p.idcontrato AND (( SELECT date_part('Day'::text, p.datapagamento) AS date_part)) > c_1.diavencimento::double
 precision AND (( SELECT date_part('Month'::text, p.datapagamento) AS date_part)) = (( SELECT date_part('Month'::text, CURRENT_DATE) AS mesatu))),0) AS pagosematraso,
    Coalesce(( SELECT sum(c_1.valor) AS pagosnovencimento
           FROM contrato c_1
             JOIN pagamentos p ON c_1.idcontrato = p.idcontrato AND (( SELECT date_part('Day'::text, p.datapagamento) AS date_part)) <= c_1.diavencimento::double precision AND (( SELECT date_part('Month'::text, p.datapagamento) AS date_part
)) = (( SELECT date_part('Month'::text, CURRENT_DATE) AS date_part))),0) AS pagosnovencimento,
                          
 coalesce((select sum(valorpago) from pagamentos p
		where  Coalesce(( SELECT date_part('Month'::text, p.datapagamento)),0) =
 Coalesce(( SELECT date_part('Month'::text, CURRENT_DATE)),0)),0) as emdia
   FROM contrato c
  WHERE c.status = 1;""";
