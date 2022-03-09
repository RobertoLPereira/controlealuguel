// ignore: unused_import
import 'package:controlealuguel/src/models/pessoas/pessoas_wrap.dart';
import 'package:controlealuguel/src/pages/contrato/pagamento_form_back.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:intl/intl.dart' as intl;
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

// ignore: unused_import
import 'package:controlealuguel/app/domain/entities/contact.dart';

import '../../../application.dart';

// ignore: must_be_immutable
class PagamentoFormWidgets extends StatefulWidget {
  PessoasWrap contact;
  PagamentoFormWidgets({
    Key key,
    this.contact,
  }) : super(key: key);

  @override
  _PagamentoFormWidgetsState createState() => _PagamentoFormWidgetsState();
}

class _PagamentoFormWidgetsState extends State<PagamentoFormWidgets> {
  final _formKey = GlobalKey<FormState>();
  String title = '';

  String description = '';
  DateTime date = DateTime.now();
  double maxValue = 0;
  bool brushedTeeth = false;
  bool enableFeature = false;
  final _cValor = MoneyMaskedTextController(
    thousandSeparator: '.',
    decimalSeparator: ',',
    leftSymbol: 'R\$ ',
  );
  Widget fieldName(PagamentoFormBack back) {
    return TextFormField(
        validator: back.validateName,
        onSaved: (newValue) => back.pessoawrap.nome = newValue,
        initialValue: back.pessoawrap.nome,
        enabled: false,
        decoration: InputDecoration(labelText: 'Nome:'));
  }

  Widget fieldPhone(PagamentoFormBack back) {
    var mask = MaskTextInputFormatter(mask: '(##) # ####-####');
    return TextFormField(
        validator: back.validatePhone,
        onSaved: (newValue) => back.pessoawrap.telefone = newValue,
        initialValue: back.pessoawrap.telefone,
        enabled: false,
        inputFormatters: [mask],
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            labelText: 'Telefone:', hintText: '(99) 9 9999-9999'));
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      //print(widget.contact.id);
    });

    //store.fetchPessoa();
  }

  @override
  Widget build(BuildContext context) {
    var _back = PagamentoFormBack(context);
    // ignore: unused_local_variable
    var _backPagto = PagamentoFormBack(context);
    final inputValor = TextFormField(
      controller: _cValor,
      autofocus: false,
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        hintText: 'Valor R\$',
        contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      validator: (value) {
        if (currencyToDouble(value) < 0.0) {
          return 'Obrigatório';
        }
        return null;
      },
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Efetuar Pagamento'),
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                // _form.currentState.validate();
                // _form.currentState.save();
                _backPagto.save(context);
                if (_back.isValid) {
                  _backPagto.save(context);
                }
              })
        ],
      ),
      body: Form(
        key: _formKey,
        child: Scrollbar(
          child: Align(
            alignment: Alignment.topCenter,
            child: Card(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 400),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ...[
                        fieldName(_back),
                        fieldPhone(_back),
                        _FormDatePicker(
                          date: date,
                          onChanged: (value) {
                            setState(() {
                              date = value;
                            });
                          },
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Valor estimado',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ],
                            ),
                            inputValor,
                            Text(
                              intl.NumberFormat.currency(
                                      symbol: "\$", decimalDigits: 0)
                                  .format(maxValue),
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                            /*TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              // ignore: missing_return
                              validator: (text) {
                                if (!RegExp(r'^\d{3}\.\d{3}\.\d{3}-\d{2}$')
                                    .hasMatch(text ?? '')) {
                                  return 'Digite um CPF valido!';
                                }
                              },
                              inputFormatters: [
                                CurrencyMask(
                                    symbol: r'$', decimal: ',', cents: '.')
                              ],
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Valor recebido',
                              ),
                            ),*/
                            Slider(
                              min: 0,
                              max: 1000,
                              divisions: 1000,
                              value: maxValue,
                              onChanged: (value) {
                                setState(() {
                                  maxValue = value;
                                });
                              },
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Checkbox(
                              value: brushedTeeth,
                              onChanged: (checked) {
                                setState(() {
                                  brushedTeeth = checked;
                                });
                              },
                            ),
                            Text('Brushed Teeth',
                                style: Theme.of(context).textTheme.subtitle1),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('Enable feature',
                                style: Theme.of(context).textTheme.bodyText1),
                            Switch(
                              value: enableFeature,
                              onChanged: (enabled) {
                                setState(() {
                                  enableFeature = enabled;
                                });
                              },
                            ),
                          ],
                        ),
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
        ),
      ),
    );
  }
}

class _FormDatePicker extends StatefulWidget {
  final DateTime date;
  final ValueChanged<DateTime> onChanged;

  const _FormDatePicker({
    this.date,
    this.onChanged,
  });

  @override
  _FormDatePickerState createState() => _FormDatePickerState();
}

class _FormDatePickerState extends State<_FormDatePicker> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Date',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            Text(
              intl.DateFormat.yMd().format(widget.date),
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ],
        ),
        TextButton(
          child: const Text('Edit'),
          onPressed: () async {
            var newDate = await showDatePicker(
              context: context,
              initialDate: widget.date,
              firstDate: DateTime(1900),
              lastDate: DateTime(2100),
            );

            // Don't change the date if the date picker returns null.
            if (newDate == null) {
              return;
            }

            widget.onChanged(newDate);
          },
        )
      ],
    );
  }
}
