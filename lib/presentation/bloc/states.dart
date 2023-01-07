import '../../domain/entities/article_entity.dart';

abstract class NewsAppStates {}

class LoadingState extends NewsAppStates {}

class NewsAppStartState extends NewsAppStates {}

class ShowArticleState extends NewsAppStates {}

class ShowAllNewsState extends NewsAppStates {
  final bool isMoreAllNews;
  final List<NewsArticle> listOfData;
  final int page;

  ShowAllNewsState({
    required this.isMoreAllNews,
    required this.listOfData,
    required this.page,
  });
}

class ShowTopNewsState extends NewsAppStates {
  final bool isMoreTopNews;
  final List<NewsArticle> listOfData;
  final int page;

  ShowTopNewsState({
    required this.isMoreTopNews,
    required this.listOfData,
    required this.page,
  });
}