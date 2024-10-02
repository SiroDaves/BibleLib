import 'package:floor/floor.dart';

import '../../../utils/constants/app_constants.dart';
import '../../models/history.dart';
import '../../models/exts/historyext.dart';

@dao
abstract class HistoriesDao {
  @Query('SELECT * FROM ${AppConstants.historiesTable}')
  Future<List<History>> fetchHistories();

  @Query('SELECT * FROM ${AppConstants.historiesTableViews}')
  Stream<List<HistoryExt>> fetchHistoryExts();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertHistory(History history);

  @delete
  Future<void> deleteHistory(History history);

  @Query("DELETE FROM ${AppConstants.historiesTable}")
  Future<void> deleteAllHistories();
}
