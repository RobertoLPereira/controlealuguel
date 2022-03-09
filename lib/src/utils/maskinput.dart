import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class MaskInput extends TextInputFormatter {
  final String mask;
  final bool trim;
  MaskInput(this.mask, {this.trim = true});
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var value = newValue.text.replaceAll(RegExp(r'\D'), '');
    var formatted = mask;
    for (var i = 0; i < value.length; i++) {
      formatted = formatted.replaceFirst('#', value[i]);
    }
    final lastHash = formatted.indexOf('#');
    if (lastHash != -1) {
      formatted = formatted.characters.getRange(0, lastHash).join();
      if (RegExp(r'\D$').hasMatch(formatted)) {
        formatted =
            formatted.split('').getRange(0, formatted.length - 1).join();
      }
    }
    return newValue.copyWith(
      text: formatted,
      selection: TextSelection.fromPosition(
        TextPosition(offset: formatted.length),
      ),
    );
  }
}

/*TextFormField(autovalidateMode: AutovalidateMode.onUserInteratioction,
   validator:(text) {
    if(!RegExp(r'').hasMatch(text ?? '')){return 'Digite um CPF valido!';}
   },
inputFormatters:[
  //MaskInput(),
  ReakMask(symbol:r'$', decimal:',',cents:'.')],
  decoration: InputDecoration(border: OutLineInputBorder(),labelText:'Real',),),
*/
class CurrencyMask extends TextInputFormatter {
  final String symbol;
  final String decimal;
  final String cents;

  CurrencyMask({this.symbol, this.decimal, this.cents});
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var value = newValue.text.replaceAll(RegExp(r'\D'), '');
    value = (int.tryParse(value) ?? 0).toString();
    if (value.length < 3) {
      value = value.padLeft(3, '0');
    }
    value = value.split('').reversed.join();
    final listCharacters = [];
    // ignore: unused_local_variable
    var decimailCount = 0;
    for (var i = 0; i < value.length; i++) {
      if (i == 2) {
        listCharacters.insert(0, cents);
      }
      if (i > 2) {
        decimailCount++;
      }
      if (i == 3) {
        listCharacters.insert(0, decimal);
        decimailCount = 0;
      }
      listCharacters.insert(0, value[i]);
    }
    listCharacters.insert(0, symbol);
    var formatted = listCharacters.join();
    return newValue.copyWith(
      text: formatted,
      selection: TextSelection.fromPosition(
        TextPosition(offset: formatted.length),
      ),
    );
  }
}
