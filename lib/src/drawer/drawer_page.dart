import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../../responsive_layout.dart';

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

class DrawerPage extends StatefulWidget {
  @override
  _DrawerPageState createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Constants.kPadding * 4),
          child: Column(
            children: [
              ListTile(
                title: Text(
                  "Admin Menu",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                trailing: !ResponsiveLayout.isComputer(context)
                    ? IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.close, color: Colors.white),
                      )
                    : null,
              ),
              ...List.generate(
                _buttonNames.length,
                (index) => Column(
                  children: [
                    Container(
                      decoration: index == _currentIndex
                          ? BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(
                                colors: [
                                  Constants.red.withOpacity(0.9),
                                  Constants.orange.withOpacity(0.9),
                                ],
                              ),
                            )
                          : null,
                      child: ListTile(
                        title: Text(
                          _buttonNames[index].title,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        leading: Padding(
                          padding: const EdgeInsets.all(Constants.kPadding),
                          child: Icon(
                            _buttonNames[index].icon,
                            color: Colors.white,
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            _currentIndex = index;
                          });
                          Navigator.of(context).pushNamed(wrota[_currentIndex]);
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    Divider(
                      color: Colors.white,
                      thickness: 0.1,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
