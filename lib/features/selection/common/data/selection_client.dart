import 'dart:async';

import 'package:http/http.dart';

import '../../../../common/utils/api_util.dart';
import '../../../../common/utils/constants/app_constants.dart';

class SelectionClient {
  /// Fetch all the bibles
  Future<Response> getBibles() async {
    return await makeApiGetRequest(
      AppConstants.baseUrl + 'bible',
      {
        'Content-Type': 'application/json',
      },
    );
  }

  /// Fetch all the books
  Future<Response> getBooks() async {
    return await makeApiGetRequest(
      AppConstants.baseUrl + 'bible',
      {
        'Content-Type': 'application/json',
      },
    );
  }

  /// Fetch all verses
  Future<Response> getVerses() async {
    return await makeApiGetRequest(
      AppConstants.baseUrl + 'bible',
      {
        'Content-Type': 'application/json',
      },
    );
  }

  /// Fetch verses by book ids
  Future<Response> getVersesByBooks(String booksId) async {
    return await makeApiGetRequest(
      AppConstants.baseUrl + 'bible',
      {
        'Content-Type': 'application/json',
      },
    );
  }
}
