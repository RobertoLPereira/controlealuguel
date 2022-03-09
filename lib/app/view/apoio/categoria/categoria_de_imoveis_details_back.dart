import 'package:controlealuguel/src/models/apoio/categorias.dart';
import 'package:flutter/cupertino.dart';

class CategoriaDetailsBack {
  BuildContext context;
  Categorias categ;

  CategoriaDetailsBack(this.context) {
    categ = ModalRoute.of(context).settings.arguments;
  }

  goToBack() {
    Navigator.of(context).pop();
  }
}
