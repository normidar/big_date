import 'package:big_date/src/big_date_base.dart';

class ChinaDate extends BigDate {
  ChinaDate.utc(int year) : super.utc(year);
  ChinaDate.now() : super.now();
  ChinaDate.fromMillisecondsSinceEpoch(int millisecondsSinceEpoch)
      : super.fromMillisecondsSinceEpoch(millisecondsSinceEpoch);
  ChinaDate.fromMicrosecondsSinceEpoch(int microsecondsSinceEpoch)
      : super.fromMicrosecondsSinceEpoch(microsecondsSinceEpoch);
  ChinaDate(int year,
      [int month = 1,
      int day = 1,
      int hour = 0,
      int minute = 0,
      int second = 0,
      int millisecond = 0,
      int microsecond = 0])
      : super(year, month, day, hour, minute, second, millisecond, microsecond);

  @override
  String get locatedFullWeekDay => "星期" + locatedWeekDay;

  @override
  String get locatedWeekDay {
    switch (weekday) {
      case 7:
        return "日";
      case 1:
        return "一";
      case 2:
        return "二";
      case 3:
        return "三";
      case 4:
        return "四";
      case 5:
        return "五";
      case 6:
        return "六";
      default:
        throw Exception();
    }
  }

  List<String> tenGan = ["甲", "乙", "丙", "丁", "戊", "己", "庚", "辛", "壬", "癸"];
  List<String> diZhi = [
    "子",
    "丑",
    "寅",
    "卯",
    "辰",
    "巳",
    "午",
    "未",
    "申",
    "酉",
    "戌",
    "亥"
  ];

  String get gan {
    if (year > 0) {
      int n = year % 10;
      int _gan = n > 3 ? n - 4 : n + 6;
      return tenGan[_gan];
    }
    int n = year.abs() % 10;
    int _gan = n < 8 ? 7 - n : 17 - n;
    return tenGan[_gan];
  }

  String get zhi {
    if (year > 0) {
      int n = year % 12;
      int _zhi = n > 3 ? n - 4 : n + 8;
      return diZhi[_zhi];
    }
    int n = year.abs() % 12;
    int _zhi = n < 10 ? 9 - n : 21 - n;
    return diZhi[_zhi];
  }

  String get ganZhi {
    return gan + zhi;
  }
}
