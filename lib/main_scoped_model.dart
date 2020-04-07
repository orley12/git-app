import 'dart:convert';
import 'dart:async';

import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;

import './repo.dart';

class RepoModel extends Model {
  final List<Repo> _repos = [];

  List<Repo> get allRepos {
    return List.from(_repos);
  }

  Future<Null> fetchRepos() {
    // _isLoading = true;
    // notifyListeners();
    return http
        .get(
            'https://api.github.com/search/repositories?q=flutter+language:dart')
        .then<Null>((http.Response response) {
      final Map<String, dynamic> apiResponds = json.decode(response.body);
      List items = apiResponds['items'];
      items.forEach((dynamic item) {
        final Repo repo = Repo(
            id: item['id'].toString(),
            name: item['name'],
            login: item['owner']['login']);

        _repos.add(repo);
      });
      notifyListeners();
    }).catchError((error) {
      // _isLoading = false;
      notifyListeners();
      return;
    });
  }
}
