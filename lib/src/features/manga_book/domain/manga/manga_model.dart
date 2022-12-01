// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../constants/enum.dart';
import '../../../browse_center/domain/source/source_model.dart';
import '../chapter/chapter_model.dart';

part 'manga_model.freezed.dart';
part 'manga_model.g.dart';

@freezed
class Manga with _$Manga {
  factory Manga({
    String? artist,
    String? author,
    String? description,
    int? downloadCount,
    int? chapterCount,
    Chapter? lastChapterRead,
    bool? freshData,
    List<String>? genre,
    bool? inLibrary,
    int? id,
    int? inLibraryAt,
    bool? initialized,
    String? realUrl,
    Source? source,
    String? sourceId,
    @JsonKey(fromJson: MangaStatus.fromJson, toJson: MangaStatus.toJson)
        MangaStatus? status,
    String? thumbnailUrl,
    String? title,
    int? unreadCount,
    int? lastFetchedAt,
    int? chaptersLastFetchedAt,
    String? url,
    Map<String, dynamic>? meta,
  }) = _Manga;

  factory Manga.fromJson(Map<String, dynamic> json) => _$MangaFromJson(json);
}
