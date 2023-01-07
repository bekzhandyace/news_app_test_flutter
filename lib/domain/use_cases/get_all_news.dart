import 'package:new_app/core/use_case/use_case.dart';
import 'package:new_app/domain/entities/article_entity.dart';
import 'package:new_app/domain/repository/repository.dart';

class GetAllNews extends UseCase<List<NewsArticle>, Parameters> {
  final GetDataInterface getDataInterface;

  GetAllNews(this.getDataInterface);

  @override
  Future<List<NewsArticle>> call(Parameters parameters) async {
    return await getDataInterface.getAllNews(parameters.question, parameters.page, parameters.limit);
  }
}

class Parameters {
  final int page;
  final int limit;
  final String question;

  Parameters(this.question, this.page, this.limit);
}