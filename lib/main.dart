import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_app/presentation/bloc/news_app_bloc.dart';
import 'package:new_app/presentation/favorites_cubit/favorites_cubit.dart';
import 'package:new_app/presentation/pages/favorite_news_page.dart';
import 'package:new_app/presentation/pages/news_page.dart';
import 'package:new_app/presentation/pages/start_page.dart';
import 'package:new_app/service_locator/service_locator.dart' as sl;
import 'package:new_app/service_locator/service_locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  sl.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          home: MultiBlocProvider(
            providers: [
              BlocProvider<FavoritesCubit>(
                create: (context) => serviceLocator<FavoritesCubit>(),
                child: const FavoriteNewsPage(),
              ),
              BlocProvider<NewsAppBloc>(
                create: (context) => serviceLocator<NewsAppBloc>(),
                child: const NewsPage(),
              ),
            ],
            child: const StartPage(),
          ),
        );
      },
    );
  }
}

