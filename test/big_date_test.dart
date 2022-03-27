import 'package:big_date/big_date.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    setUp(() {
      // Additional setup goes here.
    });

    test('Format Test', () {
      // expect(DateTime(2022).format("%yyyy") == "2022", isTrue);
      // expect(DateTime(2022).format(r"\yyyy") == r"yyyy", isTrue);
      print(DateTime(2022).format(r"%YYYYY%_mm"));
      print(DateTime(2021, 7, 12).format(r"yyyy\ym\md\d"));
      // expect(DateTime(2021, 7, 12).format(r"yyyy\ym\md\d") == "2021y7m12d",
      //     isTrue);
      // expect(DateTime(2012, 4, 9).format(r"yyyy\ymm\mdd\d") == "2012y04m09d",
      //     isTrue);
      // print(DateTime(2012, 4, 9).format(r"yyyy\ymm\mdd\\d"));
      // expect(DateTime(2012, 4, 9).format(r"yyyy\ymm\mdd\d") == r"2012y04m09d",
      //     isTrue);
      // expect(DateTime(2012, 4, 9).format(r"yyyy年mm月dd日") == r"2012年04月09日",
      //     isTrue);
    });
  });
}
