// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

// 📦 Package imports:
import 'package:intl/intl.dart';

// 🌎 Project imports:
import 'date_time_extensions.dart';

extension IntExtensions on int? {
  bool get isNull => this == null;
  bool get isZero => this != null ? this! == 0 : false;
  bool liesBetween({int lower = 0, int upper = 1}) =>
      this != null ? this! >= lower && this! <= upper : false;
  bool isGreaterThan(int i) => isNull ? false : this! > i;
  bool isLessThan(int i) => isNull ? false : this! < i;

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

  String get toDaysAgo {
    if (isNull) return "";
    return DateTime.fromMillisecondsSinceEpoch(this!).convertToDaysAgo;
  }

  bool isSameDayAs(int? anotherDate) {
    if (isNull || anotherDate.isNull) return false;
    return DateTime.fromMillisecondsSinceEpoch(this! * 1000)
        .isSameDay(DateTime.fromMillisecondsSinceEpoch(anotherDate! * 1000));
  }
}