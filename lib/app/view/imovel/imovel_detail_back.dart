import 'package:controlealuguel/src/models/bens/imovelWrap.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

class ImovelDetailsBack {
  BuildContext context;
  ImovelWrap imovel;

  ImovelDetailsBack(this.context) {
    imovel = ModalRoute.of(context).settings.arguments;
  }

  goToBack() {
    Navigator.of(context).pop();
  }

  _launchApp(String url, Function(BuildContext context) showModalError) async {
    await canLaunch(url) ? await launch(url) : showModalError(context);
  }

  launchIdimovel(Function(BuildContext context) showModalError) {
    _launchApp('idimovel:${imovel.idimovel}', showModalError);
  }

  launchDescricao(Function(BuildContext context) showModalError) {
    _launchApp('descricao:${imovel.descricao}', showModalError);
  }

  launchEndereco(Function(BuildContext context) showModalError) {
    _launchApp('endereco:${imovel.endereco}', showModalError);
  }

  launchIdproprietario(Function(BuildContext context) showModalError) {
    _launchApp('idproprietario:${imovel.idproprietario}', showModalError);
  }

  launchStatus(Function(BuildContext context) showModalError) {
    _launchApp('status:${imovel.status}', showModalError);
  }

  launchIdimovelcategoria(Function(BuildContext context) showModalError) {
    _launchApp('idimovelcategoria:${imovel.idimovelcategoria}', showModalError);
  }
}
