import 'package:floor/floor.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../utils/constants/app_constants.dart';

part 'book.g.dart';

@Entity(tableName: AppConstants.booksTable)
@JsonSerializable()
class Book {
  @PrimaryKey(autoGenerate: true)
  int? rid;
  int? bookId;
  String? title;
  String? subTitle;
  int? verses;
  int? position;
  int? bookNo;
  bool? enabled;
  String? created;
  String? updated;

  Book({
    this.bookId,
    this.title,
    this.subTitle,
    this.verses,
    this.position,
    this.bookNo,
    this.enabled,
    this.created,
    this.updated,
  });

  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);

  Map<String, dynamic> toJson() => _$BookToJson(this);
}

