import 'dart:convert';

import 'package:controlealuguel/src/models/dashboard/dashboard_piza.dart';
import 'package:controlealuguel/src/utils/controller_dashboard.dart';
import 'package:controlealuguel/src/utils/vw_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../constants.dart';
import '../../../responsive_layout.dart';
import '../../nomedosservidores.dart';
import '../charts.dart';
import 'package:http/http.dart' as http;

class Todo {
  String name;
  bool enable;
  Todo({this.enable = true, this.name});
}

class PanelLeftPage extends StatefulWidget {
  @override
  _PanelLeftPageState createState() => _PanelLeftPageState();
}

class _PanelLeftPageState extends State<PanelLeftPage> {
  final ctr = DashBoardController();

  List<Todo> _todos = [
    Todo(name: "Purchase Paper", enable: true),
    Todo(name: "Refill the inventory of speakers", enable: true),
    Todo(name: "Hire someone", enable: true),
    Todo(name: "Maketing Strategy", enable: true),
    Todo(name: "Selling furniture", enable: true),
    Todo(name: "Finish the disclosure", enable: true),
  ];
  List dashboard = [];
  dynamic wtotal;
  var wdash = <DashboardPiza>[];
  @override
  void initState() {
    super.initState();
    this.fetchDashBoard();
    print('painel');
    //wtotal = ctr.total;
    print(wtotal.toString());
    print('painel 2');
  }

  fetchDashBoard() async {
    try {
      setState(() async {
        var url = NomeServidoresApi.Api_Alugueis + 'Consultar/$vw_dashboard';
        try {
          var response = await http.get(Uri.tryParse(url));
          //print(response.body);
          //print("foi impresso body");
          if (response.statusCode == 200) {
            var resultado = jsonDecode(response.body);
            Iterable listDart = json.decode(response.body);

            setState(() {
              for (Map<String, dynamic> map in listDart) {
                wdash.add(DashboardPiza(
                    ativos: int.parse(map['ativos']),
                    valortotalcontrato: map['valortotalcontrato'],
                    inativos: int.parse(map['inativos']),
                    vencidos: (map['vencidos'] - map['pagosnovencimento']),
                    pagosematraso: map['pagosematraso'],
                    pagosnovencimento: map['pagosnovencimento'],
                    emdia: map['emdia']));
              }
              wtotal = wdash[0].valortotalcontrato;
              ctr.atualiza_valores(wdash);
              ctr.valor_contrato();
              dashboard = resultado;

              print('$wtotal');
            });
          } else {
            dashboard = [];
          }
        } catch (e) {
          if (e.toString() == 'XMLHttpRequest error') {
            print('Servidor fora do ar');
          }
          print(e.toString());
        }
      });
    } catch (e) {
      print('deu erro ' + e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          if (ResponsiveLayout.isComputer(context))
            Container(
              color: Constants.purpleLight,
              width: 50,
              child: Container(
                decoration: BoxDecoration(
                  color: Constants.purpleDark,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                  ),
                ),
              ),
            ),
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: Constants.kPadding / 2,
                      top: Constants.kPadding / 2,
                      right: Constants.kPadding / 2),
                  child: Card(
                      color: Constants.purpleLight,
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Observer(builder: (_) {
                        return Container(
                          width: double.infinity,
                          child: ListTile(
                            //leading: Icon(Icons.shopping_basket),
                            title: Text(
                              "Valor total de Contrato",
                              style: TextStyle(color: Colors.white),
                            ),
                            subtitle: Text(
                              "100% Contratado",
                              style: TextStyle(color: Colors.white),
                            ),
                            trailing: Chip(
                              label: Text(
                                'R\$$wtotal',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        );
                      })),
                ),
                PieChartSample2(),
                LineChartSample2(),
                Padding(
                  padding: const EdgeInsets.only(
                      right: Constants.kPadding / 2,
                      bottom: Constants.kPadding,
                      top: Constants.kPadding,
                      left: Constants.kPadding / 2),
                  child: Card(
                    color: Constants.purpleLight,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: List.generate(
                        _todos.length,
                        (index) => CheckboxListTile(
                          title: Text(
                            _todos[index].name,
                            style: TextStyle(color: Colors.white),
                          ),
                          value: _todos[index].enable,
                          onChanged: (newValue) {
                            setState(() {
                              _todos[index].enable = newValue ?? true;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
