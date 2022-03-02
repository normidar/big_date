import 'package:big_date/big_date.dart';

void main() {
  DateTime d = DateTime(2022, 3, 2);
  print(d.format("WW"));
  print(d.locatedWeekDay);
}
