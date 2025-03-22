import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension Stringx on String{
  String? convertToAgo({String inFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS", String text = ''}) {
    try {
      DateTime input = DateFormat(inFormat).parse(this, true);
      Duration diff = DateTime.now().difference(input);
      if (diff.inDays > 365) {
        return '${(diff.inDays / 365).floor()}y${diff.inDays == 1 ? '' : ''} $text';
      } else if (diff.inDays > 7) {
        return '${(diff.inDays / 7).floor()}w${diff.inDays == 1 ? '' : ''} $text';
      } else if (diff.inDays >= 1) {
        return '${diff.inDays}d${diff.inDays == 1 ? '' : ''} $text';
      } else if (diff.inHours >= 1) {
        return '${diff.inHours}h${diff.inHours == 1 ? '' : ''} $text';
      } else if (diff.inMinutes >= 1) {
        return '${diff.inMinutes} min${diff.inMinutes == 1 ? '' : ''} $text';
      } else if (diff.inSeconds >= 1) {
        return '${diff.inSeconds} sec${diff.inSeconds == 1 ? '' : ''} $text';
      } else {
        return 'just now';
      }
    } catch (e) {
      debugPrint('error while parsing $e');
      return null;
    }
  }
}

extension DateTimeX on DateTime {
  String? formatDate({String outFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS"}) {
    try {
      return DateFormat(outFormat).format(this);
    } catch (e) {
      return null;
    }
  }
}

extension ServerFormattedDate on String {
  String getServerFormatDate() {
    var localDate = DateTime.parse(this).toLocal();
    var inputFormat = DateFormat('yyyy-MM-dd HH:mm');
    var inputDate = inputFormat.parse(localDate.toString());
    var outputFormat = DateFormat('yyyy-MM-dd');
    var outputDate = outputFormat.format(inputDate);

    return outputDate.toString();
  }
}

extension UserFormattedDate on String {
  String getUserFormatDate({String format = 'yyyy-MM-dd HH:mm',String outFormat = 'dd/MM/yyyy'}) {
    var localDate = DateTime.parse(this).toLocal();

    /// inputFormat - format getting from api or other func.
    /// e.g If 2021-05-27 9:34:12.781341 then format should be yyyy-MM-dd HH:mm
    /// If 27/05/2021 9:34:12.781341 then format should be dd/MM/yyyy HH:mm
    var inputFormat = DateFormat(format);
    var inputDate = inputFormat.parse(localDate.toString());

    /// outputFormat - convert into format you want to show.
    var outputFormat = DateFormat(outFormat);
    var outputDate = outputFormat.format(inputDate);

    return outputDate.toString();
  }
}

 

class DateParser {
  static DateFormat normalDateFormat = DateFormat('dd/MM/yyyy');

  static DateFormat databaseFormat = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");
  static DateFormat normalDateAnd12HourFormat =
      DateFormat("dd/MM/yyyy hh:mm a");
       static DateFormat notesDateAnd12HourFormat =
      DateFormat("dd MMM yyyy hh:mm a");
  static DateFormat normal12HourFormat = DateFormat("hh:mm a");

  static DateFormat onlyYearFormat = DateFormat("yyyy");

  static DateFormat displayDateFormat = DateFormat("dd MMM yyyy");

  static DateFormat dashboardFilterFormat = DateFormat("yyyy-MM-dd");

  static DateFormat onlyTimeDateFormat = DateFormat.jm();

  static parsedTime(dynamic timeString, {bool isUtc = false}) {
    DateTime parsedTime = DateTime.parse(timeString).copyWith(isUtc: isUtc);
    return parsedTime;
  }

  static fromMillisecondTime(int timestamp, {bool isUtc = false}) {
    DateTime parsedTime =
        DateTime.fromMillisecondsSinceEpoch(timestamp).copyWith(isUtc: isUtc);
    return parsedTime;
  }

static DateTime parseUtcToLocal(String utcDateString) {
    // Parse the UTC date string to DateTime
    DateTime utcDateTime = DateTime.parse(utcDateString);

    // Convert UTC DateTime to local time
    return utcDateTime.toLocal();
  }

  static dayAgoFormat(dynamic agoDate) {
    DateTime agoDt = parsedTime(agoDate);
    DateTime currentDate = DateTime.now();

    if (agoDt.isAfter(currentDate)) {
      return "-";
    }
    // int differenceInDays = currentDate.difference(agoDt).inDays;
    if (currentDate.difference(agoDt).inDays > 0) {
      int differenceInDays = currentDate.difference(agoDt).inDays;
      if (differenceInDays == 1) {
        return "${differenceInDays.toString()} day";
      } else {
        return "${differenceInDays.toString()} days";
      }
    } else if (currentDate.difference(agoDt).inHours > 0) {
      int differenceInHours = currentDate.difference(agoDt).inHours;
      return "${differenceInHours.toString()} hours";
    } else if (currentDate.difference(agoDt).inMinutes > 0) {
      int differenceInMinutes = currentDate.difference(agoDt).inMinutes;
      return "${differenceInMinutes.toString()} minutes";
    }
  }

  static calculateDateDifferenceString(String dateString) {
    if (dateString.length != 8) {
      return "-";
    }
    DateTime currentDate = DateTime.now();
    int? year = int.tryParse(dateString.substring(0, 4));
    int? month = int.tryParse(dateString.substring(4, 6));
    int? day = int.tryParse(dateString.substring(6, 8));
    if (year == null || month == null || day == null) {
      return "-";
    }
    if (!DateTime(year, month, day).isBefore(currentDate)) {
      return "-";
    }
    int differenceInDays =
        currentDate.difference(DateTime(year, month, day)).inDays;

    return "${differenceInDays.toString()} days";
  }

  static String timeHrFormat(dynamic agoDate) {
    DateTime agoDt = parsedTime(agoDate);
    DateTime currentDate = DateTime.now();

    if (agoDt.isAfter(currentDate)) {
      return "-";
    }

    Duration difference = currentDate.difference(agoDt);

    if (difference.inDays > 0) {
      return "${difference.inDays} day${difference.inDays == 1 ? '' : 's'}";
    } else if (difference.inHours > 0) {
      return "${difference.inHours} hour${difference.inHours == 1 ? '' : 's'}";
    } else if (difference.inMinutes > 0) {
      return "${difference.inMinutes} minute${difference.inMinutes == 1 ? '' : 's'}";
    } else {
      return "Just now";
    }
  }
}

storeNormal({String? date}) {
  DateTime timestamp = DateTime.parse(date!).toLocal();
  debugPrint("timestamp   $timestamp");

  String formattedDate = DateFormat('dd/MM/yyyy').format(timestamp);
  DateTime dateS = parseDateString(formattedDate);
  DateTime dateFull = DateTime.parse(date);
  debugPrint('_+_+++_+_+_+_+_+_+=======');
  debugPrint('dateFull: $dateFull');
  debugPrint('_+_+++_+_+_+_+_+_+---------');

  String formattedTime = DateFormat('hh:mm a').format(timestamp);
  TimeOfDay timeS = parseTimeString(formattedTime);

  debugPrint('Date: $formattedDate');
  debugPrint('Time: $formattedTime');

  return {
    "dateFull": dateFull,
    "date": formattedDate,
    "time": formattedTime,
    "dateS": dateS,
    "timeS": timeS,
  };
}

DateTime parseDateString(String dateString) {
  List<String> dateComponents = dateString.split('/');
  int day = int.parse(dateComponents[0]);
  int month = int.parse(dateComponents[1]);
  int year = int.parse(dateComponents[2]);
  return DateTime(year, month, day);
}

TimeOfDay parseTimeString(String timeString) {
  List<String> components = timeString.split(' ');
  List<String> timeComponents = components[0].split(':');
  int hour = int.parse(timeComponents[0]);
  int minute = int.parse(timeComponents[1]);
  if (components[1] == 'AM' && hour == 12) {
    // Handle special case for 12 AM
    hour = 0;
  } else if (components[1] == 'PM' && hour != 12) {
    // Convert hour to 24-hour format for PM times
    hour += 12;
  }
  return TimeOfDay(hour: hour, minute: minute);
}
