import 'package:dio/dio.dart';
import 'package:flutter_github_search/models/search_model.dart';

class SearchService {
  Future<SearchModel> searchUser({String username, String per_page}) async {
    try {
      var response = await Dio().get('https://api.github.com/search/users?q=' +
          username +
          '&per_page=' +
          per_page +
          '');
      return SearchModel.fromJson(response.data);
    } catch (e) {
      print(e);
    }
  }
}
