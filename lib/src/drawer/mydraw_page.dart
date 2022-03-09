import 'package:flutter/material.dart';
import 'package:multilevel_drawer/multilevel_drawer.dart';

import 'secundary_screen.dart';

class ButtonsInfo {
  String title;
  IconData icon;

  ButtonsInfo({this.title, this.icon});
}

class Task {
  String task;
  double taskValue;
  Color color;

  Task({this.task, this.taskValue, this.color});
}

int _currentIndex = 0;

List<ButtonsInfo> _buttonNames = [
  ButtonsInfo(title: "Home", icon: Icons.home),
  ButtonsInfo(title: "Leitura Água", icon: Icons.water),
  ButtonsInfo(title: "Leitura Luz", icon: Icons.light),
  ButtonsInfo(title: "Pessoas", icon: Icons.person),
  ButtonsInfo(title: "Imoveis", icon: Icons.home_filled),
  ButtonsInfo(title: "Unidade", icon: Icons.home_mini),
  ButtonsInfo(title: "Pagamentos", icon: Icons.monetization_on),
  ButtonsInfo(title: "Categorias", icon: Icons.category),
  ButtonsInfo(title: "Situações", icon: Icons.verified_user),
  ButtonsInfo(title: "Faixa de Consumo", icon: Icons.ac_unit),
  ButtonsInfo(title: "Nat. Relacionamento", icon: Icons.person_pin),
  ButtonsInfo(title: "Exemplo de ComboBox", icon: Icons.account_tree_outlined),
  ButtonsInfo(title: "Cidades", icon: Icons.location_city_rounded),
];
List wrota = [
  '/home',
  '/Leituraaguaunidade',
  '/Leituraluzunidade',
  '/Pessoas',
  '/Imoveis',
  '/Unidades',
  '/PagamentosPessoa',
  '/Categorias',
  '/Status',
  '/FaixaConsumo',
  '/NaturezaRelac',
  '/ComboBox',
];

class MyDrawerPage extends StatefulWidget {
  @override
  _MyDrawerPageState createState() => _MyDrawerPageState();
}

class _MyDrawerPageState extends State<MyDrawerPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        drawer: MultiLevelDrawer(
          backgroundColor: Colors.white,
          rippleColor: Colors.white,
          subMenuBackgroundColor: Colors.grey.shade100,
          divisionColor: Colors.grey,
          header: Container(
            height: size.height * 0.25,
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  "assets/dp_default.png",
                  width: 100,
                  height: 100,
                ),
                SizedBox(
                  height: 10,
                ),
                Text("Admin Menu S")
              ],
            )),
          ),
          children: [
            MLMenuItem(
              leading: Icon(Icons.person),
              trailing: Icon(Icons.arrow_right),
              content: Text(
                _buttonNames[0].title,
              ),
              onClick: () {
                setState(() {
                  _currentIndex = 0;
                });
                Navigator.of(context).pushNamed(wrota[_currentIndex]);
              },
            ),
            MLMenuItem(
                leading: Icon(Icons.settings),
                trailing: Icon(Icons.arrow_right),
                content: Text(
                  _buttonNames[1].title,
                ),
                onClick: () {
                  setState(() {
                    _currentIndex = 1;
                  });
                  Navigator.of(context).pushNamed(wrota[_currentIndex]);
                },
                subMenuItems: [
                  MLSubmenu(onClick: () {}, submenuContent: Text("Option 1")),
                  MLSubmenu(onClick: () {}, submenuContent: Text("Option 2"))
                ]),
            MLMenuItem(
              leading: Icon(Icons.notifications),
              content: Text(
                _buttonNames[2].title,
              ),
              onClick: () {
                setState(() {
                  _currentIndex = 2;
                });
                Navigator.of(context).pushNamed(wrota[_currentIndex]);
              },
            ),
            MLMenuItem(
              leading: Icon(Icons.payment),
              trailing: Icon(Icons.arrow_right),
              content: Text(
                _buttonNames[3].title,
              ),
              subMenuItems: [
                MLSubmenu(onClick: () {}, submenuContent: Text("Option 1")),
                MLSubmenu(onClick: () {}, submenuContent: Text("Option 2")),
                MLSubmenu(onClick: () {}, submenuContent: Text("Option 3")),
                MLSubmenu(onClick: () {}, submenuContent: Text("Option 4")),
              ],
              onClick: () {
                setState(() {
                  _currentIndex = 3;
                });
                Navigator.of(context).pushNamed(wrota[_currentIndex]);
              },
            ),
            MLMenuItem(
              leading: Icon(Icons.payment),
              trailing: Icon(Icons.arrow_right),
              content: Text(
                _buttonNames[4].title,
              ),
              subMenuItems: [
                MLSubmenu(onClick: () {}, submenuContent: Text("Option 1")),
                MLSubmenu(onClick: () {}, submenuContent: Text("Option 2")),
                MLSubmenu(onClick: () {}, submenuContent: Text("Option 3")),
                MLSubmenu(onClick: () {}, submenuContent: Text("Option 4")),
              ],
              onClick: () {
                setState(() {
                  _currentIndex = 4;
                });
                Navigator.of(context).pushNamed(wrota[_currentIndex]);
              },
            ),
            MLMenuItem(
              leading: Icon(Icons.payment),
              trailing: Icon(Icons.arrow_right),
              content: Text(
                _buttonNames[5].title,
              ),
              subMenuItems: [
                MLSubmenu(onClick: () {}, submenuContent: Text("Option 1")),
                MLSubmenu(onClick: () {}, submenuContent: Text("Option 2")),
                MLSubmenu(onClick: () {}, submenuContent: Text("Option 3")),
                MLSubmenu(onClick: () {}, submenuContent: Text("Option 4")),
              ],
              onClick: () {
                setState(() {
                  _currentIndex = 5;
                });
                Navigator.of(context).pushNamed(wrota[_currentIndex]);
              },
            ),
            MLMenuItem(
              leading: Icon(Icons.payment),
              trailing: Icon(Icons.arrow_right),
              content: Text(
                _buttonNames[6].title,
              ),
              subMenuItems: [
                MLSubmenu(onClick: () {}, submenuContent: Text("Option 1")),
                MLSubmenu(onClick: () {}, submenuContent: Text("Option 2")),
                MLSubmenu(onClick: () {}, submenuContent: Text("Option 3")),
                MLSubmenu(onClick: () {}, submenuContent: Text("Option 4")),
              ],
              onClick: () {
                setState(() {
                  _currentIndex = 6;
                });
                Navigator.of(context).pushNamed(wrota[_currentIndex]);
              },
            ),
            MLMenuItem(
                leading: Icon(Icons.payment),
                trailing: Icon(Icons.arrow_right),
                content: Text(
                  "New Option 1",
                ),
                subMenuItems: [
                  MLSubmenu(onClick: () {}, submenuContent: Text("Option 1")),
                  MLSubmenu(onClick: () {}, submenuContent: Text("Option 2")),
                  MLSubmenu(onClick: () {}, submenuContent: Text("Option 3")),
                  MLSubmenu(onClick: () {}, submenuContent: Text("Option 4")),
                ],
                onClick: () {}),
            MLMenuItem(
              leading: Icon(Icons.payment),
              trailing: Icon(Icons.arrow_right),
              content: Text(
                _buttonNames[7].title,
              ),
              subMenuItems: [
                MLSubmenu(onClick: () {}, submenuContent: Text("Option 1")),
                MLSubmenu(onClick: () {}, submenuContent: Text("Option 2")),
                MLSubmenu(onClick: () {}, submenuContent: Text("Option 3")),
                MLSubmenu(onClick: () {}, submenuContent: Text("Option 4")),
              ],
              onClick: () {
                setState(() {
                  _currentIndex = 7;
                });
                Navigator.of(context).pushNamed(wrota[_currentIndex]);
              },
            ),
            MLMenuItem(
              leading: Icon(Icons.payment),
              trailing: Icon(Icons.arrow_right),
              content: Text(
                _buttonNames[8].title,
              ),
              subMenuItems: [
                MLSubmenu(onClick: () {}, submenuContent: Text("Option 1")),
                MLSubmenu(onClick: () {}, submenuContent: Text("Option 2")),
                MLSubmenu(onClick: () {}, submenuContent: Text("Option 3")),
                MLSubmenu(onClick: () {}, submenuContent: Text("Option 4")),
              ],
              onClick: () {
                setState(() {
                  _currentIndex = 8;
                });
                Navigator.of(context).pushNamed(wrota[_currentIndex]);
              },
            ),
            MLMenuItem(
              leading: Icon(Icons.payment),
              trailing: Icon(Icons.arrow_right),
              content: Text(
                _buttonNames[9].title,
              ),
              subMenuItems: [
                MLSubmenu(onClick: () {}, submenuContent: Text("Option 1")),
                MLSubmenu(onClick: () {}, submenuContent: Text("Option 2")),
                MLSubmenu(onClick: () {}, submenuContent: Text("Option 3")),
                MLSubmenu(onClick: () {}, submenuContent: Text("Option 4")),
              ],
              onClick: () {
                setState(() {
                  _currentIndex = 9;
                });
                Navigator.of(context).pushNamed(wrota[_currentIndex]);
              },
            ),
            MLMenuItem(
              leading: Icon(Icons.payment),
              trailing: Icon(Icons.arrow_right),
              content: Text(
                _buttonNames[10].title,
              ),
              subMenuItems: [
                MLSubmenu(onClick: () {}, submenuContent: Text("Option 1")),
                MLSubmenu(onClick: () {}, submenuContent: Text("Option 2")),
                MLSubmenu(onClick: () {}, submenuContent: Text("Option 3")),
                MLSubmenu(onClick: () {}, submenuContent: Text("Option 4")),
              ],
              onClick: () {
                setState(() {
                  _currentIndex = 10;
                });
                Navigator.of(context).pushNamed(wrota[_currentIndex]);
              },
            ),
            MLMenuItem(
              leading: Icon(Icons.payment),
              trailing: Icon(Icons.arrow_right),
              content: Text(_buttonNames[11].title),
              subMenuItems: [
                MLSubmenu(
                    onClick: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SecondScreen()));
                    },
                    submenuContent: Text("Option 1")),
                MLSubmenu(onClick: () {}, submenuContent: Text("Option 2")),
                MLSubmenu(onClick: () {}, submenuContent: Text("Option 3")),
                MLSubmenu(onClick: () {}, submenuContent: Text("Option 4")),
              ],
              onClick: () {
                setState(() {
                  _currentIndex = 11;
                });
                Navigator.of(context).pushNamed(wrota[_currentIndex]);
              },
            ),
          ],
        ),
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            "Multi Level Menu",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromRGBO(255, 65, 108, 1.0),
                    Color.fromRGBO(255, 75, 43, 1.0),
                  ]),
            ),
            child: Center()),
      ),
    );
  }
}
