import 'package:shared_preferences/shared_preferences.dart';

class ValidaAutenticacao {
  Future<bool> verificaToken() async {
    SharedPreferences shp = await SharedPreferences.getInstance();
    if (shp.getString('Token').isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }
}
