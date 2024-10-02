import 'dart:async';

import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import '../models/exts/models.dart';
import '../models/models.dart';
import 'dao/books_dao.dart';
import 'dao/histories_dao.dart';
import 'dao/listeds_dao.dart';
import 'dao/searches_dao.dart';
import 'dao/verses_dao.dart';

part 'app_database.g.dart';

@Database(
  version: 2,
  entities: [
    Book,
    History,
    Listed,
    Search,
    Verse,
  ],
  views: [HistoryExt, ListedExt, VerseExt],
)
abstract class AppDatabase extends FloorDatabase {
  BooksDao get booksDao;
  HistoriesDao get historiesDao;
  ListedsDao get listedsDao;
  SearchesDao get searchesDao;
  VersesDao get versesDao;
}

Future<AppDatabase> buildInMemoryDatabase() {
  return $FloorAppDatabase
      .inMemoryDatabaseBuilder()
      .build();
}
