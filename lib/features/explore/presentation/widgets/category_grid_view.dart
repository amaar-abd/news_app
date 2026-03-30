import 'package:flutter/material.dart';
import 'package:news_app/core/routing/app_routes.dart';
import 'package:news_app/core/utils/app_iamges.dart';
import 'package:news_app/features/explore/data/models/category_model.dart';
import 'package:news_app/features/explore/presentation/widgets/category_card.dart';

class CategoryGridView extends StatelessWidget {
  const CategoryGridView({super.key});
  final List<CategoryModel> categories = const [
    CategoryModel(
      title: 'Technology',
      imagePath: Assets.assetsImagesCategoriesTechnology,
    ),
    CategoryModel(
      title: 'Sports',
      imagePath: Assets.assetsImagesCategoriesSports,
    ),
    CategoryModel(
      title: 'Trading',
      imagePath: Assets.assetsImagesCategoriesTaeding,
    ),
    CategoryModel(
      title: 'Policy',
      imagePath: Assets.assetsImagesCategoriesPolicy,
    ),
    CategoryModel(
      title: 'Health',
      imagePath: Assets.assetsImagesCategoriesHealth,
    ),
    CategoryModel(
      title: 'Business',
      imagePath: Assets.assetsImagesCategoriesBusiness,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: categories.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 15,
        crossAxisSpacing: 12,
        childAspectRatio: 5 / 4,
      ),
      itemBuilder: (context, index) {
        return CategoryCard(
          title: categories[index].title,
          imagePath: categories[index].imagePath,
          onTap: () {
            Navigator.of(context, rootNavigator: true).pushNamed(
              AppRoutes.exploreDetailsView,
              arguments: categories[index].title,
            );
          },
        );
      },
    );
  }
}
