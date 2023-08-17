import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_clean_architecture_with_apis_database/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:flutter_bloc_clean_architecture_with_apis_database/features/daily_news/presentation/bloc/article/remote/remote_article_state.dart';

class DailyNews extends StatelessWidget {
  const DailyNews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  _buildAppBar() {
    return AppBar(
      title: const Text(
        "Daily News",
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  _buildBody() {
    return BlocBuilder<RemoteArticleBloc, RemoteArticleState>(
      builder: (_, state) {
        if (state is RemoteArticleLoadingState) {
          return const Center(child: CircularProgressIndicator(color: Colors.red));
        }
        if (state is RemoteArticleErrorState) {
          return Center(
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.refresh),
            ),
          );
        }
        if (state is RemoteArticleLoadedState) {
          return ListView.builder(
              itemCount: state.articles!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(index.toString()),
                );
              });
        }
        return SizedBox();
      },
    );
  }
}
