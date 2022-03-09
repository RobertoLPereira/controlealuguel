import 'package:controlealuguel/src/models/apoio/naturezarelacionamentos.dart';

import 'package:flutter/cupertino.dart';

class NatRelacDetailsBack {
  BuildContext context;
  Naturezarelacionamento natRelac;

  NatRelacDetailsBack(this.context) {
    natRelac = ModalRoute.of(context).settings.arguments;
  }

  goToBack() {
    Navigator.of(context).pop();
  }
}
