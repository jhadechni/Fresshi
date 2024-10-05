import 'package:intl/intl.dart';
import 'package:loggy/loggy.dart';

class Formatter {
  static String formatNumberCOP(String number) {
    try {
      final numberFormat = NumberFormat.currency(
        locale: 'en_US', 
        symbol: "\$", 
        decimalDigits: 0
      );
      return numberFormat.format(double.parse(number));
    } catch (e) {
      logInfo("Error formatting number: $e");
      return number;
    }
  }

  static String unFormatNumberCOP(String number) {
    try {
      return number.replaceAll('\$', '').replaceAll('.', '').replaceAll(',', '');
    } catch (e) {
      logInfo("Error unformatting number: $e");
      return number;
    }
  }

  static String formatDate(DateTime date) {
    final formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(date);
  }
}
