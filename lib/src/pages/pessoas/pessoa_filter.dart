import 'dart:async';
import 'package:controlealuguel/src/models/pessoas/pessoas.dart';
import 'package:controlealuguel/src/services/pessoas/pessoas_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PessoaFilter extends StatefulWidget {
  static const routeName = '/pessoaoria-filter';

  PessoaFilter() : super();

  final String title = "Pessoas Cadastradas";

  @override
  PessoaFilterState createState() => PessoaFilterState();
}

class Debouncer {
  final int milliseconds;
  VoidCallback action;
  Timer timer;

  Debouncer({
    this.milliseconds,
    this.action,
    this.timer,
  });

  run(VoidCallback action) {
    if (null != timer) {
      timer.cancel();
    }
    timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}

class PessoaFilterState extends State<PessoaFilter> {
  //
  final _debouncer = Debouncer(milliseconds: 500);
  List<Pessoas> pessoa = [];
  List<Pessoas> filteredpessoa = [];

  @override
  Future<void> initState() async {
    super.initState();
    PessoaService.getPessoas().then((value) {
      setState(() {
        pessoa = value;
        filteredpessoa = pessoa;
      });
    });
  }

  CircleAvatar circleAvatar(String url) {
    url = url.replaceFirst('https', 'hrrp');
    return (Uri.tryParse(url).isAbsolute)
        ? CircleAvatar(backgroundImage: NetworkImage(url))
        : CircleAvatar(child: Icon(Icons.person));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            height: 40,
            decoration: BoxDecoration(
              color: Colors.cyan[50],
              borderRadius: BorderRadius.circular(15),
            ),
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Pesquisar...',
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(10),
                  child: SvgPicture.asset('assets/icons/search.svg'),
                ),
              ),
              onChanged: (string) {
                _debouncer.run(() {
                  setState(() {
                    filteredpessoa = pessoa
                        .where((u) => (u.nome
                                .toLowerCase()
                                .contains(string.toLowerCase()) ||
                            u.nome
                                .toLowerCase()
                                .contains(string.toLowerCase())))
                        .toList();
                  });
                });
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(10.0),
              itemCount: filteredpessoa.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: 90,
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child:
                                Image.network(filteredpessoa[index].url_avatar),
                          ),
                        ),
                        Text(
                          filteredpessoa[index].nome,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          filteredpessoa[index].nome.toLowerCase(),
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.grey,
                          ),
                        ),
                        FloatingActionButton(
                          onPressed: () => Navigator.of(context).pushNamed(
                              '/Pagamentos',
                              arguments: filteredpessoa[index]),
                          child: Icon(
                            Icons.check,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
