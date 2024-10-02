import 'dart:async';

import 'package:http/http.dart';

import '../data/selection_client.dart';

class SelectionRepository {
  final _selectionClient = SelectionClient();

  /// Fetch all books
  Future<Response> getBooks() async => await _selectionClient.getBooks();

  /// Fetch  all verses
  Future<Response> getVerses() async => await _selectionClient.getVerses();

  /// Fetch verses by book ids
  Future<Response> getVersesByBooks(String bookIds) async =>
      await _selectionClient.getVersesByBooks(bookIds);
}
