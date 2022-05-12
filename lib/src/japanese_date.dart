import 'package:big_date/big_date.dart';

class JapanDate extends BigDate {
  JapanDate.utc(int year) : super.utc(year);
  JapanDate.now() : super.now();
  JapanDate.fromMillisecondsSinceEpoch(int millisecondsSinceEpoch)
      : super.fromMillisecondsSinceEpoch(millisecondsSinceEpoch);
  JapanDate.fromMicrosecondsSinceEpoch(int microsecondsSinceEpoch)
      : super.fromMicrosecondsSinceEpoch(microsecondsSinceEpoch);
  JapanDate(int year,
      [int month = 1,
      int day = 1,
      int hour = 0,
      int minute = 0,
      int second = 0,
      int millisecond = 0,
      int microsecond = 0])
      : super(year, month, day, hour, minute, second, millisecond, microsecond);

  /// use Japanese now Era to get DateTime
  /// like `JapanDate.era(4)` will be 2022
  /// we should to change it when Era changed
  JapanDate.era(int year,
      [int month = 1,
      int day = 1,
      int hour = 0,
      int minute = 0,
      int second = 0,
      int millisecond = 0,
      int microsecond = 0])
      : super(year + 2018, month, day, hour, minute, second, millisecond,
            microsecond);

  @override
  String get locatedFullWeekDay => locatedWeekDay + "曜日";

  @override
  String get locatedWeekDay {
    switch (weekday) {
      case 7:
        return "日";
      case 1:
        return "月";
      case 2:
        return "火";
      case 3:
        return "水";
      case 4:
        return "木";
      case 5:
        return "金";
      case 6:
        return "土";
      default:
        throw Exception();
    }
  }

  /// after 明徳(1390)
  final Map<int, String> _muromatiEraMap = {
    1595: "慶長",
    1591: "文禄",
    1572: "天正",
    1569: "元亀",
    1557: "永禄",
    1554: "弘治",
    1531: "天文",
    1527: "享禄",
    1520: "大永",
    1503: "永正",
    1500: "文亀",
    1491: "明応",
    1488: "延徳",
    1486: "長享",
    1468: "文明",
    1466: "応仁",
    1465: "文正",
    1459: "寛正",
    1456: "長禄",
    1454: "康正",
    1451: "享徳",
    1448: "宝徳",
    1443: "文安",
    1440: "嘉吉",
    1428: "永享",
    1427: "正長",
    1393: "応永",
    1389: "明徳",
  };

  /// after 元和(1615)
  final Map<int, String> _edoEraMap = {
    1864: "慶応",
    1863: "元治",
    1860: "万延",
    1854: "安政",
    1847: "嘉永",
    1843: "弘化",
    1829: "天保",
    1817: "文政",
    1803: "文化",
    1800: "享和",
    1788: "寛政",
    1780: "天明",
    1771: "安永",
    1763: "明和",
    1750: "宝暦",
    1747: "寛延",
    1743: "延享",
    1740: "寛保",
    1735: "元文",
    1715: "享保",
    1710: "正徳",
    1703: "宝永",
    1687: "元禄",
    1683: "貞享",
    1680: "天和",
    1672: "延宝",
    1660: "寛文",
    1657: "万治",
    1654: "明暦",
    1651: "承応",
    1647: "慶安",
    1643: "正保",
    1623: "寛永",
    1614: "元和",
  };

  /// after 明治(1868)
  final Map<int, String> _nowEraMap = {
    2018: "令和",
    1988: "平成",
    1925: "昭和",
    1911: "大正",
    1867: "明治",
  };
  @override
  String get locatedYear {
    if (year > 1867) {
      for (int i in _nowEraMap.keys) {
        int _yearNum = year - i;
        if (_yearNum > 0) return _nowEraMap[i]! + _yearNum.toString();
      }
    }
    if (year > 1614) {
      for (int i in _edoEraMap.keys) {
        int _yearNum = year - i;
        if (_yearNum > 0) return _edoEraMap[i]! + _yearNum.toString();
      }
    }
    if (year > 1390) {
      for (int i in _muromatiEraMap.keys) {
        int _yearNum = year - i;
        if (_yearNum > 0) return _muromatiEraMap[i]! + _yearNum.toString();
      }
    }
    return "無年号";
  }
}
