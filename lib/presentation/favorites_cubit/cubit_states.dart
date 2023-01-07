import '../../domain/entities/article_entity.dart';

abstract class FavoritesCubitStates {}

class ShowAllFavorites extends FavoritesCubitStates {
  final List<NewsArticle> listOfData;

  ShowAllFavorites({required this.listOfData});
}

class FavoritesStartState extends FavoritesCubitStates {}