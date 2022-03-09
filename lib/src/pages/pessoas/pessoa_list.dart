import 'dart:async';

import 'package:controlealuguel/src/models/pessoas/pessoas.dart';
import 'package:controlealuguel/src/services/pessoas/pessoas_service.dart';
import 'package:controlealuguel/src/states/pessoa_state.dart';
import 'package:controlealuguel/src/store/pessoas_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uno/uno.dart';

class PessoaList extends StatefulWidget {
  static const routeName = '/pessoas';

  //final _back = PessoaListBack();
  const PessoaList({Key key}) : super(key: key);

  @override
  State<PessoaList> createState() => _PessoaListState();
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

class _PessoaListState extends State<PessoaList> {
  final store = PessoaStore(PessoaService(Uno()));
  final _debouncer = Debouncer(milliseconds: 500);

  List<Pessoas> pessoa = [];
  List<Pessoas> filteredpessoa = [];
  CircleAvatar circleAvatar(String url) {
    return (Uri.tryParse(url).isAbsolute)
        ? CircleAvatar(backgroundImage: NetworkImage(url))
        : CircleAvatar(child: Icon(Icons.person));
  }

  Widget iconEditButton(Function onPressed) {
    return IconButton(
      icon: Icon(Icons.edit),
      color: Colors.orange,
      onPressed: () {},
    );
  }

  Widget iconPagtoButton(Function onPressed) {
    return IconButton(
        icon: Icon(Icons.money_sharp), color: Colors.green, onPressed: () {});
  }

  Widget iconRemoveButton(BuildContext context, Function remove) {
    return IconButton(
        icon: Icon(Icons.delete),
        color: Colors.red,
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: Text('Excluir'),
                    content: Text('Confirma a Exclusão?'),
                    actions: [
                      // ignore: deprecated_member_use
                      ElevatedButton(
                        child: Text('Não'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      // ignore: deprecated_member_use
                      ElevatedButton(
                        child: Text('Sim'),
                        onPressed: () {},
                      ),
                    ],
                  ));
        });
  }

  @override
  void initState() {
    super.initState();
    store.fetchPessoa();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Lista de Contatos'),
          actions: [
            IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  // _back.goToForm(context);
                }),
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
          ],
        ),
        body: ValueListenableBuilder(
          valueListenable: store,
          builder: (_, state, child) {
            if (state is LoadingPessoaState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is ErrorPessoaState) {
              return Center(
                child: Text(state.message),
              );
            }
            if (state is SucessPessoaState) {
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
              );
              return ListView.builder(
                  itemCount: state.pessoas.length,
                  itemBuilder: (_, index) {
                    final pessoa = state.pessoas[index];
                    String telefone;
                    if (pessoa.telefone == null) {
                      telefone = 'Não informado';
                    } else {
                      telefone = pessoa.telefone;
                    }
                    return ListTile(
                      leading: circleAvatar(pessoa.url_avatar),
                      title: Text(pessoa.nome),
                      onTap: () {},
                      subtitle: Text(telefone),
                      trailing: Container(
                        width: 120,
                        child: Row(
                          children: [
                            iconEditButton(() {
                              // _back.goToForm(context, pessoa);
                            }),
                            iconPagtoButton(() {
                              //_back.remove(pessoa.idpessoa, context);
                            }),
                            iconRemoveButton(context, () {
                              //_back.remove(pessoa.idpessoa, context);
                            })
                          ],
                        ),
                      ),
                    );
                  });
            }
            return Container();
          },
        ));
  }
}
