import '../../domain/entities/article_entity.dart';

abstract class NewsAppEvents {}

class CreateFavoriteEvent extends NewsAppEvents {
  final NewsArticle newsArticle;
  final String articleName;

  CreateFavoriteEvent(this.newsArticle, this.articleName);
}

class GetAllNewsEvent extends NewsAppEvents {
  final int page;

  GetAllNewsEvent(this.page);
}

class GetTopNewsEvent extends NewsAppEvents {
  final int page;

  GetTopNewsEvent(this.page);
}

class ShowArticleEvent extends NewsAppEvents {
  final String title;
  final String description;
  final String imageUrl;

  ShowArticleEvent({
    required this.title,
    required this.description,
    required this.imageUrl,
  });
}