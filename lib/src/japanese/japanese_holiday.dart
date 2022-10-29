import 'package:big_date/src/japanese/japanese_date.dart';

extension JapanHoliday on JapanDate {
  bool get isHoliday {
    return true;
  }

  String? get holidayNameOfToday {
    final todayString = '$month,$day';
    String? holidayStr = holidayMap[todayString];
    if (holidayStr != null) {
      return holidayStr;
    }
  }

  String? _getLogicHolidayStr() {
    if (_isComingOfAgeDay()) {
      return '成人の日';
    }
  }

  /// 成人の日かどうか
  bool _isComingOfAgeDay() {
    if (month != 1 || day == 1) return false;
    DateTime yesterday = add(Duration(days: -1));
    if (yesterday.weekday != DateTime.sunday) return false;
    if (day <= 14 && day > 7) return true;
    return false;
  }

  DateTime getComingOfAgeDay() {
    DateTime day14 = DateTime(year, 1, 14);
    DateTime lastSunday = day14.add(Duration(days: -day14.weekday));
    return lastSunday.add(Duration(days: 1));
  }

  /// 確実な日のリスト
  static Map<String, String> holidayMap = {
    '1,1': '元日',
    '2,11': '建国記念日',
    '4,29': '昭和の日',
    '5,3': '憲法記念日',
    '5,4': 'みどりの日',
    '5,5': 'こどもの日',
    '11,3': '文化の日',
    '11,23': '勤労感謝の日',
  };
}
