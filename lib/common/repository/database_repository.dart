import '../data/models/exts/models.dart';
import '../data/models/models.dart';

abstract class DatabaseRepository{
  Future<List<Book>> fetchBooks();

  Future<void> saveBook(Book book);

  Future<void> removeBook(Book book);

  Future<void> removeAllBooks();

  Future<List<Verse>> fetchVerses();

  Future<List<VerseExt>> fetchVerseExts();

  Future<List<VerseExt>> fetchLikedVerses();

  Future<Verse?> findVerseById(int rid);

  Future<void> saveVerse(Verse verse);

  Future<void> updateVerse(Verse verse);
  
  Future<void> removeVerse(Verse verse);

  Future<void> removeAllVerses();

  Future<List<Listed>> fetchListeds();

  Future<List<ListedExt>> fetchListedExts();

  Future<void> saveListed(Listed listed);

  Future<void> removeListed(Listed listed);

  Future<void> removeAllListeds();

  Future<List<Search>> fetchSearches();

  Future<void> saveSearch(Search search);

  Future<void> removeSearch(Search search);

  Future<void> removeAllSearches();

  Future<List<History>> fetchHistories();

  Future<List<HistoryExt>> fetchHistoryExts();

  Future<void> saveHistory(History history);

  Future<void> removeHistory(History history);

  Future<void> removeAllHistories();
}
