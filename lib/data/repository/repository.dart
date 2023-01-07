import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:new_app/data/keys/keys.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';
import '../../core/Errors/server_exceptions.dart';
import '../../domain/entities/article_entity.dart';
import '../../domain/repository/repository.dart';

class NewsDataRepository implements GetDataInterface, CreateDataInterface, DeleteDataInterface {
  @override
  Future<List<NewsArticle>> getTopNews(String question, int page, int limit) async {
    final response = await http.get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?q=$question&pageSize=$limit&apiKey=${ApiKey.apiKey}&page=$page'));
    if (response.statusCode == 200) {
      final body = json.decode(response.body)['articles'];
      return body.map<NewsArticle>((dynamic e) => NewsArticle.fromJson(e)).toList();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<NewsArticle>> getAllNews(String question, int page, int limit) async {
    final response = await http.get(
      Uri.parse('https://newsapi.org/v2/everything?q=$question&pageSize=$limit&apiKey=${ApiKey.apiKey}&page=$page'),
    );
    if (response.statusCode == 200) {
      final body = json.decode(response.body)['articles'];
      return body.map<NewsArticle>((dynamic e) => NewsArticle.fromJson(e)).toList();
    } else {
      throw ServerException();
    }
  }

  @override
  void createFavorite(NewsArticle newsArticle, String name) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> listOfData = [];
    if (prefs.getKeys().isNotEmpty) {
      if (!prefs.getKeys().contains(name)) {
        listOfData.add(newsArticle.title);
        listOfData.add(newsArticle.content);
        listOfData.add(newsArticle.imageUrl);
        listOfData.add(newsArticle.description);
        prefs.setStringList(name, listOfData);
      }
    } else {
      listOfData.add(newsArticle.title);
      listOfData.add(newsArticle.content);
      listOfData.add(newsArticle.imageUrl);
      listOfData.add(newsArticle.description);
      prefs.setStringList(const Uuid().v4(), listOfData);
    }
  }

  @override
  Future<List<List<String>>> getAllFavorites() async {
    List<List<String>> listOfData = [];
    final prefs = await SharedPreferences.getInstance();
    prefs.getKeys().forEach((element) {
      listOfData.add(prefs.getStringList(element)!);
    });
    return listOfData;
  }

  @override
  void deleteFavorite(String name) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.getKeys().forEach((element) {
      if (prefs.getStringList(element)![0] == name) {
        prefs.remove(element);
      }
    });
  }
}