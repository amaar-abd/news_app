import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/dependency_injection/service_locator.dart';
import 'package:news_app/features/home/domain/repo/news_repository.dart';
import 'package:news_app/features/home/presentation/manager/news_cubit/news_cubit.dart';
import 'package:news_app/features/home/presentation/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => NewsCubit(getIt.get<NewsRepository>())..topHeadlineNews()..allNews(),
          child: HomeViewBody(),
        ),
      ),
    );
  }
}
