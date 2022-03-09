import 'package:controlealuguel/src/models/pagamento/pagamentoPessoa.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'pgpessoa_list_back.dart';

class PgPessoaList extends StatefulWidget {
  final wnome;

  const PgPessoaList({Key key, this.wnome}) : super(key: key);
  // ignore: unused_field
  @override
  State<PgPessoaList> createState() => _PgPessoaListState();
}

class _PgPessoaListState extends State<PgPessoaList> {
  // ignore: unused_field
  final _form = GlobalKey<FormState>();

  CircleAvatar circleAvatar(String url) {
    //print('url = $url');
    if (url == null) {
      url =
          'https://cdn.pixabay.com/photo/2013/07/13/10/07/man-156584_960_720.png';
    } else {
      url = url.replaceAll(" ", "");
    }
    return (Uri.tryParse(url).isAbsolute)
        ? CircleAvatar(backgroundImage: NetworkImage(url))
        : CircleAvatar(child: Icon(Icons.person));
  }

  void InitState() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var _back = PgPessoaListBack(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagamentos Realizados'),
        actions: [],
      ),
      body: Observer(builder: (context) {
        return FutureBuilder(
            future: _back.listPg,
            builder: (context, futuro) {
              if (!futuro.hasData) {
                return CircularProgressIndicator();
              } else {
                List<PagamentosPessoa> lista = futuro.data;
                var wid = 0;
                return ListView.builder(
                  itemCount: lista.length,
                  itemBuilder: (context, i) {
                    var contato = lista[i];
                    if (contato.telefone == null) {
                      contato.telefone = 'Não Informado';
                    }
                    if (wid != contato.idpessoa) {
                      wid = contato.idpessoa;
                      return ListTile(
                        leading: circleAvatar(contato.urlAvatar),
                        title: Text(contato.nome),
                        onTap: () {},
                        subtitle: Text(contato.telefone +
                            ' Valor pago R\$' +
                            contato.valorpago.toString() +
                            ' Pago em ' +
                            contato.datapagamento),
                        trailing: Container(
                          width: 120,
                          child: Row(
                            children: [],
                          ),
                        ),
                      );
                    }
                    return ListTile(
                      leading: Text(''),
                      title: Text(''),
                      subtitle: Text(contato.telefone +
                          ' Valor pago R\$' +
                          contato.valorpago.toString() +
                          ' Pago em ' +
                          contato.datapagamento),
                      trailing: Container(
                        width: 120,
                        child: Row(
                          children: [],
                        ),
                      ),
                    );
                  },
                );
              }
            });
      }),
    );
  }
}
