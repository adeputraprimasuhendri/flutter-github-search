import 'package:flutter/cupertino.dart';
import 'package:flutter_github_search/models/search_model.dart';
import 'package:flutter_github_search/services/search_service.dart';

class SearchProvider extends ChangeNotifier {
  final TextEditingController textsearch = new TextEditingController();
  final SearchService _searchservice = SearchService();
  SearchModel result;
  bool loading = false;

  Search() async {
    result = null;
    loading = true;
    notifyListeners();
    result = await _searchservice.searchUser(
        username: textsearch.text, per_page: "20");
    loading = false;
    notifyListeners();
  }
}
