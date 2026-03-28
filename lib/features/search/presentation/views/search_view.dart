import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/dependency_injection/service_locator.dart';
import 'package:news_app/features/search/domain/search_repo.dart';
import 'package:news_app/features/search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:news_app/features/search/presentation/widgets/search_view_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => SearchCubit(getIt.get<SearchRepo>()),
          child: SearchViewBody(),
        ),
      ),
    );
  }
}
