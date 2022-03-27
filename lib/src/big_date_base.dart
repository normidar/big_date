import 'package:big_date/src/japanese_date.dart';

class BigDate extends DateTime {
  BigDate.utc(int year,
      [int month = 1,
      int day = 1,
      int hour = 0,
      int minute = 0,
      int second = 0,
      int millisecond = 0,
      int microsecond = 0])
      : super.utc(
            year, month, day, hour, minute, second, millisecond, microsecond);
  BigDate.now() : super.now();
  BigDate.fromMillisecondsSinceEpoch(int millisecondsSinceEpoch,
      {bool isUtc = false})
      : super.fromMillisecondsSinceEpoch(millisecondsSinceEpoch, isUtc: isUtc);
  BigDate.fromMicrosecondsSinceEpoch(int microsecondsSinceEpoch,
      {bool isUtc = false})
      : super.fromMicrosecondsSinceEpoch(microsecondsSinceEpoch, isUtc: isUtc);
  BigDate(int year,
      [int month = 1,
      int day = 1,
      int hour = 0,
      int minute = 0,
      int second = 0,
      int millisecond = 0,
      int microsecond = 0])
      : super(year, month, day, hour, minute, second, millisecond, microsecond);

  /// use format string to format your datetime
  /// use YYYY to format located year.
  /// use yyyy to format Gregorian calendar year
  /// use MM to format located month. (use MM please)
  /// use _m or m to format Gregorian calendar month. (when 1~9th m will not include 0)
  /// use _D or D to format located calendar day.
  /// use _d or d to format Gregorian calendar day.
  /// use _h or h to format Gregorian calendar hour.
  /// use _i or i to format Gregorian calendar minute.
  /// use _s or s to format Gregorian calendar second.
  /// use WW to format located calendar day of week (do not use W),
  /// in original calendar it will be English:
  /// Sun, Mon, Tue, Wed, Thu, Fri, Sat,
  String format(String format, {String matchKey = "%"}) {
    // yyyy
    format = format.replaceAll(
      RegExp(r"(?<!\\)" + matchKey + "yyyy"),
      year.toString(),
    );
    format = format.replaceAll(
      RegExp(r"(?<!\\)" + matchKey + "YYYY"),
      locatedYear,
    );
    format = format.replaceAll(
      RegExp(r"(?<!\\)" + matchKey + "MM"),
      locatedMonth,
    );
    if (format.contains("m")) {
      format = format.replaceAll(
        RegExp(r"(?<!\\)" + matchKey + "_m"),
        month.toString().padLeft(2, '0'),
      );
      format = format.replaceAll(
        RegExp(r"(?<!\\)" + matchKey + "m"),
        month.toString(),
      );
    }
    if (format.contains("D")) {
      format = format.replaceAll(
        RegExp(r"(?<!\\)" + matchKey + "_D"),
        locatedDay.toString().padLeft(2, '0'),
      );
      format = format.replaceAll(
        RegExp(r"(?<!\\)" + matchKey + "D"),
        locatedDay.toString(),
      );
    }
    if (format.contains("d")) {
      format = format.replaceAll(
        RegExp(r"(?<!\\)" + matchKey + "_d"),
        day.toString().padLeft(2, '0'),
      );
      format = format.replaceAll(
        RegExp(r"(?<!\\)" + matchKey + "d"),
        day.toString(),
      );
    }
    if (format.contains("h")) {
      format = format.replaceAll(
        RegExp("(?<!\\)" + matchKey + "_h"),
        hour.toString().padLeft(2, '0'),
      );
      format = format.replaceAll(
        RegExp(r"(?<!\\)" + matchKey + "h"),
        hour.toString(),
      );
    }
    if (format.contains("i")) {
      format = format.replaceAll(
        RegExp(r"(?<!\\)" + matchKey + "_i"),
        minute.toString().padLeft(2, '0'),
      );
      format = format.replaceAll(
        RegExp(r"(?<!\\)" + matchKey + "i"),
        minute.toString(),
      );
    }
    if (format.contains("s")) {
      format = format.replaceAll(
        RegExp(r"(?<!\\)" + matchKey + "_s"),
        second.toString().padLeft(2, '0'),
      );
      format = format.replaceAll(
        RegExp(r"(?<!\\)" + matchKey + "s"),
        second.toString(),
      );
    }
    format = format.replaceAll(
      RegExp(r"(?<!\\)" + matchKey + "WW"),
      locatedWeekDay,
    );
    return format;
  }

  JapanDate toJapanDate() {
    return JapanDate(
        year, month, day, hour, minute, second, millisecond, microsecond);
  }

  String get locatedYear => year.toString();
  String get locatedMonth => month.toString();
  int get locatedDay => day;
  int get locatedHour => hour;
  int get locatedMinute => minute;
  int get locatedSecond => second;

  /// return a locatedWeekDay if it is DateTime
  /// will return Sun, Mon, Tue, Wed, Thu, Fri, Sat,
  String get locatedWeekDay {
    switch (weekday) {
      case DateTime.sunday:
        return "Sun";
      case DateTime.monday:
        return "Mon";
      case DateTime.tuesday:
        return "Tue";
      case DateTime.wednesday:
        return "Wed";
      case DateTime.thursday:
        return "Thu";
      case DateTime.friday:
        return "Fri";
      case DateTime.saturday:
        return "Sat";
      default:
        throw Exception();
    }
  }
}
