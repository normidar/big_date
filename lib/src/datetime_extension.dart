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

  DateTime get theLastDayOfMonth {
    return (month < 12)
        ? DateTime(year, month + 1, 0)
        : DateTime(year + 1, 1, 0);
  }

  DateTime get theFirstDayOfMonth {
    return DateTime(year, month, 1);
  }

  String format(String format) => toBigDate().format(format);
}
