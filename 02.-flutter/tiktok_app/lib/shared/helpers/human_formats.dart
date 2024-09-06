import 'package:intl/intl.dart';

class HumanFormats {
  
  static String compactNumber(int number){

    final formatedNumber = NumberFormat.compactCurrency(
      decimalDigits: 0,
      symbol: ''
    ).format(number);

    return formatedNumber;

  }

}