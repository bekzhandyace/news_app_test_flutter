import 'package:new_app/core/use_case/use_case.dart';

import '../entities/article_entity.dart';
import '../repository/repository.dart';

class GetTopNews extends UseCase<List<NewsArticle>, Parameters> {
  final GetDataInterface getDataInterface;

  GetTopNews(this.getDataInterface);

  @override
  Future<List<NewsArticle>> call(Parameters parameters) async {
    return await getDataInterface.getTopNews(parameters.question, parameters.page, parameters.limit);
  }
}

class Parameters {
  final int page;
  final int limit;
  final String question;

  Parameters(this.question, this.page, this.limit);
}