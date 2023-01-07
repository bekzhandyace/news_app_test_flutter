import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/presentation/bloc/news_app_bloc.dart';
import '../bloc/events.dart';
import '../bloc/states.dart';
import '../widgets/aritcle_element.dart';
import 'article_page.dart';

class AllNewsPage extends StatefulWidget {
  const AllNewsPage({Key? key}) : super(key: key);

  @override
  State<AllNewsPage> createState() => _AllNewsPageState();
}

class _AllNewsPageState extends State<AllNewsPage> {
  @override
  void initState() {
    BlocProvider.of<NewsAppBloc>(context).add(GetAllNewsEvent(1));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsAppBloc, NewsAppStates>(builder: (context, state) {
      if (state is NewsAppStartState) {
        return const Center(child: CircularProgressIndicator());
      }
      if (state is LoadingState) {
        return const Center(child: CircularProgressIndicator());
      }
      if (state is ShowAllNewsState) {
        return Material(
          color: Colors.grey.shade200,
          child: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: state.listOfData.length,
            itemBuilder: (BuildContext context, int index) {
              if (index >= state.listOfData.length - 1 && state.isMoreAllNews) {
                BlocProvider.of<NewsAppBloc>(context).add(GetAllNewsEvent(state.page));
              }
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ArticlePage(
                                title: state.listOfData[index].title,
                                content: state.listOfData[index].content,
                                imageUrl: state.listOfData[index].imageUrl,
                              )));
                },
                child: ArticleElement(
                  title: state.listOfData[index].title,
                  description: state.listOfData[index].description,
                  imageLink: state.listOfData[index].imageUrl,
                  onTap: () {
                    BlocProvider.of<NewsAppBloc>(context)
                        .add(CreateFavoriteEvent(state.listOfData[index], state.listOfData[index].title));
                  },
                  isFavorite: false,
                ),
              );
            },
          ),
        );
      }
      return const SizedBox.shrink();
    });
  }
}