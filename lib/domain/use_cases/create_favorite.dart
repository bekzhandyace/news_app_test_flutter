import 'package:new_app/domain/entities/article_entity.dart';

import '../../core/use_case/use_case.dart';
import '../repository/repository.dart';

class CreateFavorite extends UseCase<NewsArticle, Parameters> {
  final CreateDataInterface createDataInterface;

  CreateFavorite(this.createDataInterface);

  @override
  Future<NewsArticle> call(Parameters parameters) async {
    return await createDataInterface.createFavorite(
      parameters.newsArticle,
      parameters.articleName,
    );
  }
}

class Parameters {
  final NewsArticle newsArticle;
  final String articleName;
  Parameters(this.newsArticle, this.articleName);
}