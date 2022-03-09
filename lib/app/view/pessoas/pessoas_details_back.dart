import 'package:controlealuguel/src/models/pessoas/pessoas_wrap.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

class PessoasDetailsBack {
  BuildContext context;
  PessoasWrap pessoasWrap;

  PessoasDetailsBack(this.context) {
    pessoasWrap = ModalRoute.of(context).settings.arguments;
  }

  goToBack() {
    Navigator.of(context).pop();
  }

  _launchApp(String url, Function(BuildContext context) showModalError) async {
    await canLaunch(url) ? await launch(url) : showModalError(context);
  }

  launchPhone(Function(BuildContext context) showModalError) {
    _launchApp('tel:${pessoasWrap.telefone}', showModalError);
  }

  launchSMS(Function(BuildContext context) showModalError) {
    _launchApp('sms:${pessoasWrap.telefone}', showModalError);
  }

  launchEmail(Function(BuildContext context) showModalError) {
    _launchApp('mailto:${pessoasWrap.email}', showModalError);
  }
}
