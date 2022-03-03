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
  /// use mm or m to format Gregorian calendar month. (when 1~9th m will not include 0)
  /// use DD or D to format located calendar day.
  /// use dd or d to format Gregorian calendar day.
  /// use hh or h to format Gregorian calendar hour.
  /// use ii or i to format Gregorian calendar minute.
  /// use ss or s to format Gregorian calendar second.
  /// use WW to format located calendar day of week (do not use W),
  /// in original calendar it will be English:
  /// Sun, Mon, Tue, Wed, Thu, Fri, Sat,
  String format(String format) {
    // yyyy
    format = format.replaceAll(
      RegExp(r"(?<!\\)yyyy"),
      year.toString(),
    );
    format = format.replaceAll(
      RegExp(r"(?<!\\)YYYY"),
      locatedYear,
    );
    format = format.replaceAll(
      RegExp(r"(?<!\\)MM"),
      locatedMonth,
    );
    if (format.contains("m")) {
      format = format.replaceAll(
        RegExp(r"(?<!\\)mm"),
        month.toString().padLeft(2, '0'),
      );
      format = format.replaceAll(
        RegExp(r"(?<!\\)m"),
        month.toString(),
      );
    }
    if (format.contains("D")) {
      format = format.replaceAll(
        RegExp(r"(?<!\\)DD"),
        locatedDay.toString().padLeft(2, '0'),
      );
      format = format.replaceAll(
        RegExp(r"(?<!\\)D"),
        locatedDay.toString(),
      );
    }
    if (format.contains("d")) {
      format = format.replaceAll(
        RegExp(r"(?<!\\)dd"),
        day.toString().padLeft(2, '0'),
      );
      format = format.replaceAll(
        RegExp(r"(?<!\\)d"),
        day.toString(),
      );
    }
    if (format.contains("h")) {
      format = format.replaceAll(
        RegExp(r"(?<!\\)hh"),
        hour.toString().padLeft(2, '0'),
      );
      format = format.replaceAll(
        RegExp(r"(?<!\\)h"),
        hour.toString(),
      );
    }
    if (format.contains("i")) {
      format = format.replaceAll(
        RegExp(r"(?<!\\)ii"),
        minute.toString().padLeft(2, '0'),
      );
      format = format.replaceAll(
        RegExp(r"(?<!\\)i"),
        minute.toString(),
      );
    }
    if (format.contains("s")) {
      format = format.replaceAll(
        RegExp(r"(?<!\\)ss"),
        second.toString().padLeft(2, '0'),
      );
      format = format.replaceAll(
        RegExp(r"(?<!\\)s"),
        second.toString(),
      );
    }
    format = format.replaceAll(
      RegExp(r"(?<!\\)WW"),
      locatedWeekDay,
    );

    format = format.replaceAll(RegExp(r"(?<!\\)\\"), "");
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
