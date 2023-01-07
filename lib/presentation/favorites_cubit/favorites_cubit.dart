import 'package:bloc/bloc.dart';
import '../../domain/entities/article_entity.dart';
import '../../domain/use_cases/delete_favorite.dart';
import '../../domain/use_cases/get_all_favorite.dart';
import 'cubit_states.dart';

class FavoritesCubit extends Cubit<FavoritesCubitStates> {
  final GetAllFavorite getAllFavorite;
  final DeleteFavorite deleteFavorite;
  FavoritesCubit({
    required this.deleteFavorite,
    required this.getAllFavorite,
  }) : super(FavoritesStartState());

  getAllFavorites() async {
    final List<List<String>> listOfData;
    listOfData = await getAllFavorite.getDataInterface.getAllFavorites();
    final List<NewsArticle> listOfNewsArticle = listOfData
        .map((e) => NewsArticle(
              title: e[0],
              description: e[1],
              content: e[3],
              imageUrl: e[2],
            ))
        .toList();
    emit(ShowAllFavorites(listOfData: listOfNewsArticle));
  }

  deleteFavorites(String articleName) async {
    deleteFavorite.deleteDataInterface.deleteFavorite(articleName);
  }
}
