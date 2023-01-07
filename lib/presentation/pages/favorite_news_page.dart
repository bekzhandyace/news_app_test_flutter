import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/presentation/favorites_cubit/cubit_states.dart';
import 'package:new_app/presentation/favorites_cubit/favorites_cubit.dart';
import 'package:new_app/presentation/widgets/aritcle_element.dart';

import 'article_page.dart';

class FavoriteNewsPage extends StatefulWidget {
  const FavoriteNewsPage({
    Key? key,
  }) : super(key: key);

  @override
  State<FavoriteNewsPage> createState() => _FavoriteNewsPageState();
}

class _FavoriteNewsPageState extends State<FavoriteNewsPage> {
  @override
  void initState() {
    BlocProvider.of<FavoritesCubit>(context).getAllFavorites();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: BlocBuilder<FavoritesCubit, FavoritesCubitStates>(builder: (context, state) {
        if (state is FavoritesStartState) {
          return const Center(child: Text('Favorites'));
        }
        if (state is ShowAllFavorites) {
          return ListView(
            children: state.listOfData
                .map((e) => GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ArticlePage(
                                      title: e.title,
                                      content: e.content,
                                      imageUrl: e.imageUrl,
                                    )));
                      },
                      child: ArticleElement(
                        title: e.title,
                        description: e.description,
                        imageLink: e.imageUrl,
                        onTap: () {
                          BlocProvider.of<FavoritesCubit>(context).deleteFavorites(e.title);
                          BlocProvider.of<FavoritesCubit>(context).getAllFavorites();
                        },
                        isFavorite: true,
                      ),
                    ))
                .toList(),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      }),
    );
  }
}