import '../../core/use_case/use_case.dart';
import '../repository/repository.dart';

class GetAllFavorite extends UseCase<List<String>, Parameters> {
  final GetDataInterface getDataInterface;

  GetAllFavorite(this.getDataInterface);

  @override
  Future<List<String>> call(Parameters parameters) async {
    return await getDataInterface.getAllFavorites();
  }
}

class Parameters {}