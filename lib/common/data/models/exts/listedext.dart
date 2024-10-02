import 'package:floor/floor.dart';

import '../../../utils/constants/app_constants.dart';

@DatabaseView(
  '${AppConstants.listedExtSql};',
  viewName: AppConstants.listedsTableViews,
)
class ListedExt {
  int rid;
  int parentid;
  int position;
  String created;
  String updated;
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

  ListedExt(
    this.rid,
    this.parentid,
    this.position,
    this.created,
    this.updated,
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
