import 'package:intl/intl.dart';

double currencyToDouble(String value) {
  value = value.replaceFirst('R\$ ', '');
  value = value.replaceAll(RegExp(r'\.'), '');
  value = value.replaceAll(RegExp(r'\,'), '.');

  return double.tryParse(value) ?? null;
}

double currencyToFloat(String value) {
  return currencyToDouble(value);
}

String doubleToCurrency(double value) {
  NumberFormat nf = NumberFormat.currency(
    locale: 'pt_BR',
    symbol: 'R\$',
    decimalDigits: 2,
  );
  return nf.format(value);
}
