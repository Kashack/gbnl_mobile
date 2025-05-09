import 'package:flutter_test/flutter_test.dart';
import 'package:gbnl_mobile/core/utils/date_formatter.dart';

void main() {
  group('formatUnixTimestamp', () {
    test('should convert a valid UNIX timestamp to "4 AUGUST 2020"', () {
      final result = formatUnixTimestamp(1596589501);
      expect(result, '5 August 2020'.toUpperCase());
    });


    test('should throw a FormatException for negative timestamp', () {
      final result = formatUnixTimestamp(-100000);
      expect(result, '30 DECEMBER 1969');
    });
  });
}
