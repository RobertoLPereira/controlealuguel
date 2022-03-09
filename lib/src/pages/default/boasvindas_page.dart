import 'package:controlealuguel/src/pages/teste/sign_in_http.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widget_tree.dart';

class BoasVindas extends StatefulWidget {
  const BoasVindas({Key key}) : super(key: key);

  @override
  _BoasVindasState createState() => _BoasVindasState();
}

class _BoasVindasState extends State<BoasVindas> {
  @override
  void initState() {
    super.initState();
    verificaToken().then((value) => {
          if (value)
            {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => WidgetTree(),
                ),
              )
            }
          else
            {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => SignInHttpDemo(),
                ),
              )
            }
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

Future<bool> verificaToken() async {
  SharedPreferences shp = await SharedPreferences.getInstance();
  if (shp.getString('Token') != null) {
    print(shp.getString('Token'));
    return true;
  } else {
    return false;
  }
}
