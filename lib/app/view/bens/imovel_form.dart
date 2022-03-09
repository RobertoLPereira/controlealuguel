import 'package:controlealuguel/src/api/bens/imovel_api.dart';
import 'package:controlealuguel/src/models/pessoas/pessoas.dart';
import 'package:combos/combos.dart';
import 'package:flutter/material.dart';
import 'package:uno/uno.dart';

import 'imovel_form_back.dart';

class ImovelForm extends StatefulWidget {
  const ImovelForm({Key key}) : super(key: key);

  @override
  _ImovelFormState createState() => _ImovelFormState();
}

class _ImovelFormState extends State<ImovelForm> {
  final _formKey = GlobalKey<FormState>();

  List proprietarios = [];
  ImovelApi _service = ImovelApi(uno);

  static Uno uno;
  @override
  void initState() async {
    super.initState();
    setState(() async {
      proprietarios = await _service.getProrietarios();
      print(proprietarios);
    });
  }

  @override
  Widget build(BuildContext context) {
    var _back = ImovelWrapFormBack();
    //var _items = _back.findPessoas();
    var wprop;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Imovel2'),
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                _formKey.currentState.validate();
                _formKey.currentState.save();
                if (_back.isValid) {
                  _back.save(context);
                }
              })
        ],
      ),
      body: Form(
        key: _formKey,
        child: Scrollbar(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: AutofillGroup(
              child: Column(
                children: [
                  ...[
                    const Text('Dados Cadastrais '),
                    // ignore: missing_required_param
                    ListCombo<Pessoas>(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(_back.pessoaSelected?.proprietario ??
                            'Selecione um Proprietario'),
                      ),
                      getList: () => _back.findPessoas(),
                      itemBuilder: (_, parameters, item) {
                        var id = item.idpessoa.toString() + ' - ' + item.nome;
                        return ListTile(title: Text(id));
                      },
                    ),
                    DropdownButton(
                      hint: Text('Selecione proprietário'),
                      dropdownColor: Colors.grey,
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 36,
                      isExpanded: true,
                      style: TextStyle(color: Colors.black, fontSize: 22),
                      value: wprop,
                      onChanged: (newValue) {
                        setState(() {
                          wprop = newValue;
                        });
                      },
                      items: proprietarios.map((valueItem) {
                        return DropdownMenuItem(
                            value: valueItem, child: Text(valueItem));
                      }),
                    ),
                    TextFormField(
                      autofocus: true,
                      onSaved: (newValue) => _back.imovelWrap.nome = newValue,
                      initialValue: _back.imovelWrap.nome,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        hintText: '1,2,3...Conforme chave única da pessoa',
                        labelText: 'Proprietário',
                      ),
                      autofillHints: const [AutofillHints.givenName],
                    ),
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      onSaved: (newValue) =>
                          _back.imovelWrap.descricao = newValue,
                      initialValue: _back.imovelWrap.descricao,
                      decoration: const InputDecoration(
                        hintText: 'Condominio,etc',
                        labelText: 'Nome do Imovel',
                      ),
                      autofillHints: const [AutofillHints.givenName],
                    ),
                    TextFormField(
                      //keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      onSaved: (newValue) =>
                          _back.imovelWrap.categoria = newValue,
                      initialValue: _back.imovelWrap.categoria,
                      decoration: InputDecoration(
                        hintText: 'Categoria(Residencial,Comercial)',
                        labelText: 'Categoria',
                      ),
                      autofillHints: [AutofillHints.givenName],
                    ),
                    TextFormField(
                      keyboardType: TextInputType.phone,
                      textInputAction: TextInputAction.next,
                      onSaved: (newValue) =>
                          _back.imovelWrap.endereco = newValue,
                      initialValue: _back.imovelWrap.endereco,
                      decoration: InputDecoration(
                        hintText: 'Rua,Avenida,Servidão,etc',
                        labelText: 'Endereço',
                      ),
                      autofillHints: [AutofillHints.addressCity],
                    ),
                    /*const TextField(
                      keyboardType: TextInputType.streetAddress,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        hintText: '123 4th Ave',
                        labelText: 'Street Address',
                      ),
                      autofillHints: [AutofillHints.streetAddressLine1],
                    ),*/
                    TextFormField(
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      maxLength: 2,
                      decoration: InputDecoration(
                        hintText: '1,2,3,4...',
                        labelText: 'Quantidade de unidades',
                      ),
                      autofillHints: [AutofillHints.postalCode],
                    ),
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        hintText: 'Kit,Apartamento,Lojas',
                        labelText: 'Descricão da unidade',
                      ),
                      autofillHints: [AutofillHints.countryName],
                    ), /*
                    const TextField(
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      decoration: InputDecoration(
                        hintText: '1',
                        labelText: 'Country Code',
                      ),
                      autofillHints: [AutofillHints.countryCode],
                    ),*/
                  ].expand(
                    (widget) => [
                      widget,
                      const SizedBox(
                        height: 24,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
