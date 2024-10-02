import 'package:floor/floor.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../utils/constants/app_constants.dart';

part 'history.g.dart';

@Entity(tableName: AppConstants.historiesTable)
@JsonSerializable()
class History {
  @PrimaryKey(autoGenerate: true)
  int? rid;
  int? verse;
  String? created;

  History({
    this.rid,
    this.verse,
    this.created,
  });
}
