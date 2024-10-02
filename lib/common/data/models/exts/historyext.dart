import 'package:floor/floor.dart';

import '../../../utils/constants/app_constants.dart';

@DatabaseView(
  '${AppConstants.historyExtSql};',
  viewName: AppConstants.historiesTableViews,
)
class HistoryExt {
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

  HistoryExt(
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
