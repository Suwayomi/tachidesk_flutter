// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

// 🐦 Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// 📦 Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// 🌎 Project imports:
import '../../../../../i18n/locale_keys.g.dart';
import '../../../../../utils/extensions/custom_extensions/string_extensions.dart';
import '../../../../../utils/misc/toast/toast.dart';

class ClipboardListTile extends ConsumerWidget {
  const ClipboardListTile({
    super.key,
    required this.title,
    required this.subtitle,
  });
  final String title;
  final String? subtitle;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Toast toast = ref.watch(toastProvider(context));
    return ListTile(
      title: Text(title),
      subtitle: subtitle.isNotBlank ? Text(subtitle!) : null,
      onTap: subtitle.isNotBlank
          ? () {
              final msg = "$title: $subtitle";
              Clipboard.setData(
                ClipboardData(text: msg),
              );
              toast.close();
              toast.show(
                LocaleKeys.copyMsg.tr(namedArgs: {"msg": msg}),
              );
            }
          : null,
    );
  }
}