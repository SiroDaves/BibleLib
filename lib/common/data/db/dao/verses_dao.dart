import 'package:floor/floor.dart';

import '../../../utils/constants/app_constants.dart';
import '../../models/verse.dart';
import '../../models/exts/verseext.dart';

@dao
abstract class VersesDao {
  @Query('SELECT * FROM ${AppConstants.versesTable} WHERE rid = :rid')
  Future<Verse?> findVerseById(int rid);

  @Query('SELECT * FROM ${AppConstants.versesTable}')
  Future<List<Verse>> fetchVerses();

  @Query('SELECT * FROM ${AppConstants.versesTableViews}')
  Stream<List<VerseExt>> fetchVerseExts();

  @Query('SELECT * FROM ${AppConstants.versesTableViews} WHERE liked=1')
  Stream<List<VerseExt>> fetchLikedVerses();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertVerse(Verse verse);

  @update
  Future<void> updateVerse(Verse verse);

  @delete
  Future<void> deleteVerse(Verse verse);

  @Query("DELETE FROM ${AppConstants.versesTable}")
  Future<void> deleteAllVerses();
}
