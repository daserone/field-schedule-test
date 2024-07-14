import 'package:intl/intl.dart';

getTimeFromString(String time) {
  if (time == '') {
    return '';
  }

  DateTime dateTime = DateTime.parse('2021-01-01 $time:00Z');

  String formattedTime = DateFormat.jm().format(dateTime);

  return formattedTime;
}

String getFormattedDate(DateTime date) {
  // ex date format  6 de Julio 2024
  return DateFormat('d \'de\' MMMM y').format(date);
}
