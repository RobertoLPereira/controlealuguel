import '../models/dashboard/dashboard_piza.dart';
import 'package:mobx/mobx.dart';

class DashBoardController {
  dynamic total = Observable(0);
  dynamic pctatraso = Observable(0);
  dynamic pctpgemdia = Observable(0);
  dynamic pctalemdia = Observable(0);
  dynamic alvencidos = Observable(0);
  dynamic pgvecto = Observable(0);
  dynamic valortotalcontrato = Observable(0);
  Action atualiza_valores;
  Action valor_contrato;
  DashBoardController() {
    atualiza_valores = Action(_atualiza_valores);
    valor_contrato = Action(_valor_contrato);
    autorun((_) {
      print(total.toString());
    });
  }
  _atualiza_valores(DashboardPiza wdash) {
    total = wdash.valortotalcontrato;
    alvencidos =
        (wdash.vencidos - wdash.pagosnovencimento - wdash.pagosematraso);
    //print(alvencidos);
    pgvecto = (wdash.pagosnovencimento / wdash.valortotalcontrato) * 100;
    pctatraso = ((wdash.pagosematraso / wdash.valortotalcontrato) * 100)
        .roundToDouble();
    pctpgemdia =
        ((wdash.emdia / wdash.valortotalcontrato) * 100).roundToDouble();
    pctalemdia = ((wdash.pagosnovencimento / wdash.valortotalcontrato) * 100)
        .roundToDouble();
    alvencidos =
        ((alvencidos / wdash.valortotalcontrato) * 100).roundToDouble();
  }

  _valor_contrato() {
    valortotalcontrato = total;
  }
}
