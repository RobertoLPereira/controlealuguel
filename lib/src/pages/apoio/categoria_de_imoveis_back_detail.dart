/*
import 'package:flutter/cupertino.dart';
import 'package:rent_adm/src/models/apoio/categoria_de_imoveis.dart';
import 'package:url_launcher/url_launcher.dart';

class CategoriadeimoveisDetailsBack{
  BuildContext context;
  Categoriadeimoveis categoriadeimoveis;

  CategoriadeimoveisDetailsBack(this.context){
    categoriadeimoveis = ModalRoute.of(context).settings.arguments;
  }

  goToBack(){
    Navigator.of(context).pop();
  }

  _launchApp(String url, Function(BuildContext context) showModalError) async{
    await canLaunch(url) ? await launch(url) : showModalError(context);
  }
  launchIdcategoriadeimoveis(Function(BuildContext context) showModalError){
				_launchApp('idcategoriadeimoveis:${categoriadeimoveis.idcategoriadeimoveis}', showModalError);
			  }
launchDenominacao(Function(BuildContext context) showModalError){
				_launchApp('denominacao:${categoriadeimoveis.denominacao}', showModalError);
			  }
  }
*/