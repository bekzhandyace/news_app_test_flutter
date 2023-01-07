import '../entities/article_entity.dart';

abstract class GetDataInterface {
  getTopNews(String question, int page, int limit);
  getAllNews(String question, int page, int limit);
  getAllFavorites();
}

abstract class CreateDataInterface {
  createFavorite(NewsArticle newsArticle, String articleName);
}

abstract class DeleteDataInterface {
  deleteFavorite(String articleName);
}