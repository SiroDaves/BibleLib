import 'package:floor/floor.dart';

import '../../../utils/constants/app_constants.dart';

@DatabaseView(
  '${AppConstants.verseExtSql};',
  viewName: AppConstants.versesTableViews,
)
class VerseExt {
  int rid;
  int book;
  int verseId;
  int verseNo;
  String title;
  String alias;
  String content;
  int views;
  int likes;
  bool liked;
  String versebook;

  VerseExt(
    this.rid,
    this.book,
    this.verseId,
    this.verseNo,
    this.title,
    this.alias,
    this.content,
    this.views,
    this.likes,
    this.liked,
    this.versebook,
  );
}

class VerseExtSort {
  int bookNo;
  List<VerseExt> verses;

  VerseExtSort(this.bookNo, this.verses);
}
