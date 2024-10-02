import 'package:floor/floor.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../utils/constants/app_constants.dart';

part 'verse.g.dart';

@Entity(tableName: AppConstants.versesTable)
@JsonSerializable()
class Verse {
  @PrimaryKey(autoGenerate: true)
  int? rid;
  int? book;
  int? verseId;
  int? verseNo;
  String? title;
  String? alias;
  String? content;
  int? views;
  int? likes;
  bool? liked;
  String? created;
  String? updated;

  Verse({
    this.book,
    this.verseId,
    this.verseNo,
    this.title,
    this.alias,
    this.content,
    this.views,
    this.likes,
    this.liked,
    this.created,
    this.updated,
  });

  factory Verse.fromJson(Map<String, dynamic> json) => _$VerseFromJson(json);

  Map<String, dynamic> toJson() => _$VerseToJson(this);
}
