import '../data/models/exts/models.dart';
import 'database_repository.dart';
import '../data/models/models.dart';
import '../data/db/app_database.dart';

/// Implementor of Database Repository
class DatabaseRepositoryImpl implements DatabaseRepository {
  final AppDatabase _appDatabase;

  DatabaseRepositoryImpl(this._appDatabase);

  @override
  Future<List<Book>> fetchBooks() async {
    return _appDatabase.booksDao.fetchBooks();
  }

  @override
  Future<void> removeBook(Book book) async {
    return _appDatabase.booksDao.deleteBook(book);
  }

  @override
  Future<void> saveBook(Book book) async {
    return _appDatabase.booksDao.insertBook(book);
  }

  @override
  Future<void> removeAllBooks() async {
    return _appDatabase.booksDao.deleteAllBooks();
  }

  @override
  Future<List<Verse>> fetchVerses() async {
    return _appDatabase.versesDao.fetchVerses();
  }

  @override
  Future<Verse?> findVerseById(int rid) async {
    return _appDatabase.versesDao.findVerseById(rid);
  }

  @override
  Future<List<VerseExt>> fetchVerseExts() async {
    final Stream<List<VerseExt>> streams = _appDatabase.versesDao.fetchVerseExts();
    return await streams.first;
  }

  @override
  Future<List<VerseExt>> fetchLikedVerses() async {
    final Stream<List<VerseExt>> streams = _appDatabase.versesDao.fetchLikedVerses();
    return await streams.first;
  }

  @override
  Future<void> removeVerse(Verse verse) async {
    return _appDatabase.versesDao.deleteVerse(verse);
  }

  @override
  Future<void> saveVerse(Verse verse) async {
    return _appDatabase.versesDao.insertVerse(verse);
  }

  @override
  Future<void> updateVerse(Verse verse) async {
    return _appDatabase.versesDao.updateVerse(verse);
  }

  @override
  Future<void> removeAllVerses() async {
    return _appDatabase.versesDao.deleteAllVerses();
  }

  @override
  Future<List<Listed>> fetchListeds() async {
    return _appDatabase.listedsDao.fetchListeds();
  }

  @override
  Future<List<ListedExt>> fetchListedExts() async {
    final Stream<List<ListedExt>> streams = _appDatabase.listedsDao.fetchListedExts();
    return await streams.first;
  }

  @override
  Future<void> removeListed(Listed listed) async {
    return _appDatabase.listedsDao.deleteListed(listed);
  }

  @override
  Future<void> saveListed(Listed listed) async {
    return _appDatabase.listedsDao.insertListed(listed);
  }

  @override
  Future<void> removeAllListeds() async {
    return _appDatabase.listedsDao.deleteAllListeds();
  }

  @override
  Future<List<Search>> fetchSearches() async {
    return _appDatabase.searchesDao.fetchSearches();
  }

  @override
  Future<void> removeSearch(Search search) async {
    return _appDatabase.searchesDao.deleteSearch(search);
  }

  @override
  Future<void> saveSearch(Search search) async {
    return _appDatabase.searchesDao.insertSearch(search);
  }

  @override
  Future<void> removeAllSearches() async {
    return _appDatabase.searchesDao.deleteAllSearches();
  }

  @override
  Future<List<History>> fetchHistories() async {
    return _appDatabase.historiesDao.fetchHistories();
  }

  @override
  Future<List<HistoryExt>> fetchHistoryExts() async {
    final Stream<List<HistoryExt>> streams = _appDatabase.historiesDao.fetchHistoryExts();
    return await streams.first;
  }

  @override
  Future<void> removeHistory(History history) async {
    return _appDatabase.historiesDao.deleteHistory(history);
  }

  @override
  Future<void> saveHistory(History history) async {
    return _appDatabase.historiesDao.insertHistory(history);
  }

  @override
  Future<void> removeAllHistories() async {
    return _appDatabase.historiesDao.deleteAllHistories();
  }
}
