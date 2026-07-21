import 'package:intl/intl.dart';

class AppDateUtils {
  /// Format: 2026-04-11 (for Firestore dateKey)
  static String toDateKey(DateTime date) {
    return DateFormat('yyyy-MM-dd').format(date);
  }

  /// Today's dateKey
  static String todayFirebaseQuestionKey() {
    return toDateKey(DateTime.now());
  }

  /// Format: 11-04-2026
  static String toDisplayDate(DateTime date) {
    return DateFormat('dd-MM-yyyy').format(date);
  }

  /// Format: Apr 11, 2026
  static String toReadableDate(DateTime date) {
    return DateFormat('MMM dd, yyyy').format(date);
  }

  /// Format: Saturday
  static String dayName(DateTime date) {
    return DateFormat('EEEE').format(date);
  }

  /// Start of day (00:00:00)
  static DateTime startOfDay(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }

  /// End of day (next day start)
  static DateTime endOfDay(DateTime date) {
    return startOfDay(date).add(const Duration(days: 1));
  }
}
