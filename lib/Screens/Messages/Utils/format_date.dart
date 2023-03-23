import 'package:intl/intl.dart';

final DateFormat _formatter = DateFormat('yyyy-MM-dd');

class FormateDate {
  final DateTime date;
  bool thisweek() {
    final difference = DateTime.now().difference(date);
    final now = DateTime.now();

    if (date.year == now.year &&
        date.month == now.month &&
        difference.inDays <= 7) {
      return true;
    } else {
      return false;
    }
  }

  FormateDate(this.date);

  String getText() {
    final now = DateTime.now();

    if (_formatter.format(now) == _formatter.format(date)) {
      return DateFormat('jm').format(date);
    } else if (_formatter.format(DateTime(now.year, now.month, now.day - 1)) ==
        _formatter.format(date)) {
      return 'Yesterday';
    } else if (thisweek() == true) {
      return DateFormat('E').format(date);
    } else {
      String year = '';
      if (date.year == DateTime.now().year) {
        year = '';
      } else {
        year = '/${DateFormat('yy').format(date)}';
      }

      return '${DateFormat('dd').format(date)}/${DateFormat('MM').format(date)}$year';
    }
  }
}
