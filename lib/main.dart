import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_clean_architecture_with_apis_database/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:flutter_bloc_clean_architecture_with_apis_database/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:flutter_bloc_clean_architecture_with_apis_database/features/daily_news/presentation/pages/home/daily_news.dart';
import 'package:flutter_bloc_clean_architecture_with_apis_database/injection_container.dart';

import 'config/theme/app_theme.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteArticleBloc>(
      create: (context) => sl()..add(const GetArticles()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: theme(),
        home: const DailyNews(),
      ),
    );
  }
}
