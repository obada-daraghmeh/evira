import 'package:intl/intl.dart';

class Formatter {
  static String formatDate(DateTime dateTime) {
    return DateFormat('MMM dd, yyyy').format(dateTime);
  }

  static String formatTime(DateTime dateTime) {
    return DateFormat('hh:mm a').format(dateTime);
  }

  static String upperFirst(String text) {
    return text[0].toUpperCase() + text.substring(1).toLowerCase();
  }

  static String firstName(String value) {
    return value.split(' ')[0];
  }

  static String trimLower(String value) {
    return value.trim().toLowerCase();
  }
}
