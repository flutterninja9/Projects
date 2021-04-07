import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

String formatNumber({@required int number}) {
  final NumberFormat numberFormat = NumberFormat.decimalPattern();
  return numberFormat.format(number);
}
