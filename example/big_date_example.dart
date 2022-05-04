import 'package:big_date/big_date.dart';

void main() {
  // DateTime d = DateTime(2022, 3, 2);
  // d = d.toJapanDate();
  // print(d.format("WW"));
  // print(d.locatedWeekDay);

  print(DateTime.now().lastMonth.lastMonth.lastMonth.dayCountOfMonth);
  DateTime.now().forEachDayOfMonthReverse((d) => print(d));
  print((-3).abs() % 10);
}
