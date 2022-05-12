import 'package:big_date/big_date.dart';

void main() {
  final now = DateTime.now();
  print(now.lastMonth.lastMonth.lastMonth.dayCountOfMonth);
  DateTime.now().forEachDayOfMonthReverse((d) => print(d));
  print(now.format("%w"));
  print(now.toJapanDate().format("%W"));
  print(now.format("%_w"));
  print(now.toJapanDate().format("%_W"));
}
