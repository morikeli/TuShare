import 'package:intl/intl.dart';


class MessagesDateFormat {
  // show latest message's timestamp in hours and minutes
  // if message is past a day, show 'Yesterday' else show the date it was sent
  static String formatTimeinHoursAndMinutes(String dateString) {
    DateTime parsedDate = DateTime.parse(dateString);
    DateTime now = DateTime.now();
    DateTime yesterday = now.subtract(Duration(days: 1));

    if (DateFormat('yyyy-MM-dd').format(parsedDate) == DateFormat('yyyy-MM-dd').format(now)) {
      // Message was sent today → Show time in 24-hour format
      return DateFormat('HH:mm').format(parsedDate);
    } else if (DateFormat('yyyy-MM-dd').format(parsedDate) == DateFormat('yyyy-MM-dd').format(yesterday)) {
      // Message was sent yesterday → Show "Yesterday"
      return "Yesterday";
    } else {
      // Message was sent before yesterday → Show date in "dd/MM/yyyy" format
      return DateFormat('dd/MM/yyyy').format(parsedDate);
    }
  }

  static String chatBubbleTimeFormat(String dateString) {
    DateTime parsedDate = DateTime.parse(dateString);
    return DateFormat('HH:mm').format(parsedDate);    // return time in hours and minutes - 24hr clock system
  }

}
