import 'package:intl/intl.dart';

extension StringHourExtension on String {
  String toForecastDateTime() {
    final now = DateTime.now();
    final dateTime = DateTime.parse(this);
    final formattedDateTime = dateTime.add(now.timeZoneOffset).toLocal();

    if (formattedDateTime.hour == now.hour) {
      return 'now';
    } else {
      final formattedHour = DateFormat('h a').format(formattedDateTime);
      return formattedHour.toLowerCase();
    }
  }
}
