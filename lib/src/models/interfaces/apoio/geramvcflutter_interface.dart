import 'package:controlealuguel/src/models/apoio/gera_mvc_flutter.dart';

abstract class GeramvcflutterIterface {
  Future<List<GeraMvcFlutter>> find(String tabela);
  //uso de chamada REST
}
