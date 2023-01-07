import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:new_app/domain/entities/article_entity.dart';
import 'package:new_app/domain/use_cases/create_favorite.dart';
import 'package:new_app/presentation/bloc/states.dart';
import '../../domain/use_cases/get_all_news.dart';
import '../../domain/use_cases/get_top_news.dart';
import 'events.dart';

class NewsAppBloc extends Bloc<NewsAppEvents, NewsAppStates> {
  final CreateFavorite createFavorite;
  final GetAllNews getAllNews;
  final GetTopNews getTopNews;
  NewsAppBloc({
    required this.createFavorite,
    required this.getTopNews,
    required this.getAllNews,
  }) : super(NewsAppStartState()) {
    late NewsArticle tempData;
    int topNewsPage = 1;
    int topNewsLimit = 15;
    bool isMoreTopNews = true;
    List<NewsArticle> listOfTopNews = [];

//==========================================//
    int allNewsPage = 1;
    int allNewsLimit = 15;
    bool isMoreAllNews = true;
    List<NewsArticle> listOfAllNews = [];

    getTempData() async {
      List<NewsArticle> tempList = await getTopNews.getDataInterface.getTopNews('apple', 1, topNewsLimit);
      tempData = tempList.first;
    }

    getTempData();
    Timer.periodic(const Duration(seconds: 5), (timer) async {
      List<NewsArticle> tempList = await getTopNews.getDataInterface.getTopNews('apple', 1, topNewsLimit);
      if (tempList.first.title != tempData.title) {
        listOfTopNews.clear();
        isMoreTopNews = true;
        topNewsPage = 1;
        add(GetTopNewsEvent(1));
      }
    });

    on<GetTopNewsEvent>((event, emit) async {
      if (isMoreTopNews) {
        List<NewsArticle> tempList = await getTopNews.getDataInterface.getTopNews('apple', event.page, topNewsLimit);
        topNewsPage++;
        if (tempList.length < topNewsLimit || topNewsLimit * topNewsPage > 100) {
          isMoreTopNews = false;
        }
        listOfTopNews.addAll(tempList);
      }
      emit(ShowTopNewsState(listOfData: listOfTopNews, page: topNewsPage, isMoreTopNews: isMoreTopNews));
    });
    on<GetAllNewsEvent>((event, emit) async {
      if (isMoreAllNews) {
        List<NewsArticle> tempList = await getAllNews.getDataInterface.getAllNews('apple', event.page, allNewsLimit);
        allNewsPage++;
        if (tempList.length < allNewsLimit || allNewsLimit * allNewsPage > 100) {
          isMoreAllNews = false;
        }
        listOfAllNews.addAll(tempList);
        emit(ShowAllNewsState(listOfData: listOfAllNews, page: allNewsPage, isMoreAllNews: isMoreAllNews));
      }
    });
    on<CreateFavoriteEvent>((event, emit) {
      createFavorite.createDataInterface.createFavorite(event.newsArticle, event.articleName);
    });
  }
}