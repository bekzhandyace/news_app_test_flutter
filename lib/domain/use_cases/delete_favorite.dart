import 'package:new_app/domain/entities/article_entity.dart';

import '../../core/use_case/use_case.dart';
import '../repository/repository.dart';

class DeleteFavorite extends UseCase<NewsArticle, Parameters> {
  final DeleteDataInterface deleteDataInterface;

  DeleteFavorite(this.deleteDataInterface);

  @override
  Future<NewsArticle> call(Parameters parameters) async {
    return await deleteDataInterface.deleteFavorite(parameters.articleName);
  }
}

class Parameters {
  final String articleName;
  Parameters(this.articleName);
}