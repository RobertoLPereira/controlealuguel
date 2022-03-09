import 'package:controlealuguel/src/models/apoio/faixadeconsumo.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

class FaixadeconsumoDetailsBack {
  BuildContext context;
  Faixadeconsumo faixadeconsumo;

  FaixadeconsumoDetailsBack(this.context) {
    faixadeconsumo = ModalRoute.of(context).settings.arguments;
  }

  goToBack() {
    Navigator.of(context).pop();
  }

  _launchApp(String url, Function(BuildContext context) showModalError) async {
    await canLaunch(url) ? await launch(url) : showModalError(context);
  }

  launchIdfaixadeconsumo(Function(BuildContext context) showModalError) {
    _launchApp(
        'idfaixadeconsumo:${faixadeconsumo.idfaixadeconsumo}', showModalError);
  }

  launchDenominacao(Function(BuildContext context) showModalError) {
    _launchApp('denominacao:${faixadeconsumo.denominacao}', showModalError);
  }

  launchFaixainicial(Function(BuildContext context) showModalError) {
    _launchApp('faixainicial:${faixadeconsumo.faixainicial}', showModalError);
  }

  launchFaixafinal(Function(BuildContext context) showModalError) {
    _launchApp('faixafinal:${faixadeconsumo.faixafinal}', showModalError);
  }

  launchTarifaagua(Function(BuildContext context) showModalError) {
    _launchApp('tarifaagua:${faixadeconsumo.tarifaagua}', showModalError);
  }

  launchTarifaesgoto(Function(BuildContext context) showModalError) {
    _launchApp('tarifaesgoto:${faixadeconsumo.tarifaesgoto}', showModalError);
  }

  launchtfdi(Function(BuildContext context) showModalError) {
    _launchApp('tfdi:${faixadeconsumo.tfdi}', showModalError);
  }

  launchIdimovel(Function(BuildContext context) showModalError) {
    _launchApp('idimovel:${faixadeconsumo.idimovel}', showModalError);
  }
}
