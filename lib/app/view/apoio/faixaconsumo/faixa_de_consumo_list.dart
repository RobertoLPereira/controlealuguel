import 'package:controlealuguel/src/api/apoio/faixadeconsumo_api.dart';
import 'package:controlealuguel/src/models/apoio/faixadeconsumo.dart';
import 'package:controlealuguel/src/states/faixadeconsumo_state.dart';
import 'package:controlealuguel/src/store/faixadeconsumo_store.dart';

import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:uno/uno.dart';

import '../../../../nomedasrotas.dart';

class FaixaConsumoList extends StatefulWidget {
  const FaixaConsumoList({Key key}) : super(key: key);
  @override
  State<FaixaConsumoList> createState() => _FaixaConsumoListState();
}

class _FaixaConsumoListState extends State<FaixaConsumoList> {
  final faixaStore = FaixadeconsumoStore(FaixadeconsumoApi(Uno()));
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      context.read<FaixadeconsumoStore>().fetchFaixadeconsumo();
    });
  }

  @override
  Widget build(BuildContext context) {
    final store = context.watch<FaixadeconsumoStore>();
    final state = store.value;
    Widget child;
    if (state is LoadingFaixadeconsumoState) {
      child = const Center(
        child: CircularProgressIndicator(),
      );
    }
    if (state is ErrorFaixadeconsumoState) {
      child = Center(
        child: Text(state.message),
      );
    }
    if (state is SucessFaixadeconsumoState) {
      child = ListView.builder(
        itemCount: state.faixadeconsumo.length,
        itemBuilder: (_, index) {
          Faixadeconsumo lista = state.faixadeconsumo[index];
          return Card(
              elevation: 8,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Nº: ${lista.idfaixadeconsumo}',
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          'Denominação: ${lista.denominacao}',
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                    IconButton(
                        icon: Icon(Icons.edit, color: Colors.orange),
                        onPressed: () => {
                              Navigator.of(context).pushNamed(
                                  NomedasRotas.FAIXADECONSUMO_FORM,
                                  arguments: lista)
                            }),
                    IconButton(
                        icon: Icon(Icons.delete, color: Colors.redAccent),
                        onPressed: () => {
                              Navigator.of(context).pushNamed(
                                  NomedasRotas.FAIXADECONSUMO_DETAIL,
                                  arguments: lista.idfaixadeconsumo)
                            }),
                  ],
                ),
              ));
        },
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Faixa de Consumo'),
      ),
      body: child ?? Container(),
    );
  }
}
