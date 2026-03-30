import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/constants/app_colors.dart';
import 'package:news_app/features/explore/presentation/manager/explore_cubit/explore_cubit.dart';
import 'package:news_app/features/explore/presentation/widgets/custom_explore_appbar.dart';
import 'package:news_app/features/explore/presentation/widgets/explore_details_list_view.dart';

class ExploreDetailsViewBody extends StatelessWidget {
  const ExploreDetailsViewBody({super.key, required this.categoryName});
  final String categoryName;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
      child: Column(
        children: [
          CustomExploreAppbar(title: '${(categoryName).toUpperCase()} NEWS '),
          SizedBox(height: 20),
          Expanded(
            child: BlocBuilder<ExploreCubit, ExploreState>(
              builder: (context, state) {
                if (state is ExploreSuccess) {
                  return ExploreDetailsListView(articles: state.atticles);
                } else if (state is ExploreLoading) {
                  return const Center(
                    child: SizedBox(
                      height: 60,
                      width: 60,
                      child: CircularProgressIndicator(
                        color: AppColors.primaryColors,
                      ),
                    ),
                  );
                } else if (state is ExploreFailure) {
                  return Center(child: Text(state.message));
                }
                return const SizedBox();
              },
            ),
          ),
        ],
      ),
    );
  }
}
