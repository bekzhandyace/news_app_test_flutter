import 'package:get_it/get_it.dart';
import 'package:new_app/data/repository/repository.dart';
import 'package:new_app/domain/repository/repository.dart';
import 'package:new_app/domain/use_cases/create_favorite.dart';
import 'package:new_app/domain/use_cases/get_all_favorite.dart';
import 'package:new_app/domain/use_cases/get_all_news.dart';
import 'package:new_app/domain/use_cases/get_top_news.dart';
import 'package:new_app/presentation/bloc/news_app_bloc.dart';
import 'package:new_app/presentation/favorites_cubit/favorites_cubit.dart';

import '../domain/use_cases/delete_favorite.dart';

final GetIt serviceLocator = GetIt.instance;

init() {
  serviceLocator.registerFactory(
    () => FavoritesCubit(
      getAllFavorite: serviceLocator(),
      deleteFavorite: serviceLocator(),
    ),
  );
  serviceLocator.registerFactory(() => NewsAppBloc(
        getAllNews: serviceLocator(),
        getTopNews: serviceLocator(),
        createFavorite: serviceLocator(),
      ));
  serviceLocator.registerLazySingleton<GetDataInterface>(() => NewsDataRepository());
  serviceLocator.registerLazySingleton<CreateDataInterface>(() => NewsDataRepository());
  serviceLocator.registerLazySingleton<DeleteDataInterface>(() => NewsDataRepository());
  serviceLocator.registerLazySingleton(() => GetTopNews(serviceLocator()));
  serviceLocator.registerLazySingleton(() => GetAllNews(serviceLocator()));
  serviceLocator.registerLazySingleton(() => GetAllFavorite(serviceLocator()));
  serviceLocator.registerLazySingleton(() => CreateFavorite(serviceLocator()));
  serviceLocator.registerLazySingleton(() => DeleteFavorite(serviceLocator()));
}