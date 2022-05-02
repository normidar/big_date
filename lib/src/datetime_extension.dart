import 'package:big_date/src/big_date_base.dart';
import 'package:big_date/src/chinese_date.dart';
import 'package:big_date/src/japanese_date.dart';

extension DateTimeExtension on DateTime {
  BigDate toBigDate() {
    return BigDate(
        year, month, day, hour, minute, second, millisecond, microsecond);
  }

  JapanDate toJapanDate() {
    return JapanDate(
        year, month, day, hour, minute, second, millisecond, microsecond);
  }

  ChinaDate toChinaDate() {
    return ChinaDate(
        year, month, day, hour, minute, second, millisecond, microsecond);
  }

  /// get the last day of the month
  DateTime get theEndOfMonth => lastDayOfMonth;

  /// get the 1st day of the month
  DateTime get theStartOfMonth => firstDayOfMonth;

  DateTime get firstDayOfMonth => DateTime(year, month, 1);
  DateTime get lastDayOfMonth => DateTime(year, month + 1, 0);

  /// get the 1st of last month
  DateTime get lastMonth {
    return DateTime(year, month - 1, 1);
  }

  /// get the 1st of next month
  DateTime get nextMonth {
    return DateTime(year, month + 1, 1);
  }

  /// use format string to format your datetime
  ///
  /// use YYYY to format located year.
  ///
  /// use yyyy to format Gregorian calendar year
  ///
  /// use MM to format located month. (use MM please)
  ///
  /// use _m or m to format Gregorian calendar month. (when 1~9th m will not include 0)
  ///
  /// use _D or D to format located calendar day.
  ///
  /// use _d or d to format Gregorian calendar day.
  ///
  /// use _h or h to format Gregorian calendar hour.
  ///
  /// use _i or i to format Gregorian calendar minute.
  ///
  /// use _s or s to format Gregorian calendar second.
  ///
  /// use WW to format located calendar day of week (do not use W),
  ///
  /// in original calendar it will be English:
  /// Sun, Mon, Tue, Wed, Thu, Fri, Sat,
  String format(String format, {String matchKey = "%"}) =>
      toBigDate().format(format, matchKey: matchKey);
}
