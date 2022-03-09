import 'package:controlealuguel/app/view/apoio/categoria/categoria_de_imoveis_back.dart';
import 'package:controlealuguel/src/api/apoio/categorias_api.dart';
import 'package:controlealuguel/src/states/categoriadeimoveis_state.dart';
import 'package:controlealuguel/src/store/categoriadeimoveis_store.dart';
import 'package:flutter/material.dart';
import 'package:uno/uno.dart';

class CategoriaList extends StatefulWidget {
  static const routeName = '/categorias';

  CategoriaList({Key key}) : super(key: key);

  @override
  State<CategoriaList> createState() => _CategoriaListState();
}

class _CategoriaListState extends State<CategoriaList> {
  final store = CategoriadeimoveisStore(CategoriasAPI(Uno()));
  final _back = CategoriadeimoveisListBack();
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

  Widget iconCircButton(Function onPressed) {
    return IconButton(
        icon: Icon(Icons.local_activity),
        color: Colors.orange,
        onPressed: onPressed);
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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      store.fetchCategoriadeimoveis();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Lista de Categorias'),
          actions: [
            IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  // _back.goToForm(context);
                })
          ],
        ),
        body: ValueListenableBuilder(
          valueListenable: store,
          builder: (_, state, child) {
            if (state is LoadingCategoriadeimoveisState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is ErrorCategoriadeimoveisState) {
              return Center(
                child: Text(state.message),
              );
            }
            if (state is SucessCategoriadeimoveisState) {
              return ListView.builder(
                  itemCount: state.categoriadeimoveis.length,
                  itemBuilder: (_, index) {
                    final categ = state.categoriadeimoveis[index];

                    return ListTile(
                      leading: iconCircButton(() {}),
                      title: Text(categ.denominacao),
                      onTap: () {},
                      subtitle: Text(categ.idcategoriadeimoveis.toString() +
                          ' - ' +
                          categ.denominacao),
                      trailing: Container(
                        width: 120,
                        child: Row(
                          children: [
                            iconEditButton(() {
                              _back.goToForm(context, categ);
                            }),
                            iconRemoveButton(context, () {
                              _back.remove(categ.idcategoriadeimoveis);
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
