import 'package:intl/intl.dart';

String formatUnixTimestamp(int timestamp) {
  final date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  final formatter = DateFormat('d MMMM y'); // e.g. 12 June 2021
  return formatter.format(date).toUpperCase();
}