// 📦 Package imports:
import 'package:intl/intl.dart';

// 🌎 Project imports:
import 'package:tachidesk_sorayomi/src/utils/extensions/custom_extensions/date_time_extensions.dart';

extension IntExtensions on int? {
  bool get isNull => this == null;
  bool get isZero => this != null ? this! == 0 : false;
  bool liesBetween({int lower = 0, int upper = 1}) =>
      this != null ? this! >= lower && this! <= upper : false;

  String get toDateString {
    if (isNull) return "";
    return DateFormat.yMMMd().format(
      DateTime.fromMillisecondsSinceEpoch(this!),
    );
  }

  String get toDateStringFromSeconds {
    if (isNull) return "";
    return DateTime.fromMillisecondsSinceEpoch(this! * 1000).toDateString;
  }

  String get toDaysAgoFromSeconds {
    if (isNull) return "";
    return DateTime.fromMillisecondsSinceEpoch(this! * 1000).convertToDaysAgo;
  }

  bool isSameDayAs(int? anotherDate) {
    if (isNull || anotherDate.isNull) return false;
    return DateTime.fromMillisecondsSinceEpoch(this! * 1000)
        .isSameDay(DateTime.fromMillisecondsSinceEpoch(anotherDate! * 1000));
  }
}
