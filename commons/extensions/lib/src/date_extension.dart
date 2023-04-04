import 'package:dependencies/dependencies.dart';

extension DateExtension on DateTime {
  String get brazilianFormattedDate {
    return DateFormat('dd/MM/yyyy').format(this);
  }

  int get daysRemaining {
    return difference(DateTime.now()).inDays;
  }

  int get hoursRemaining {
    return difference(DateTime.now()).inHours;
  }

  int get minutesRemaining {
    return difference(DateTime.now()).inMinutes;
  }

  int get secondsRemaining {
    return difference(DateTime.now()).inSeconds;
  }
}
