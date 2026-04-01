import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_app/core/dependency_injection/service_locator.dart';
import 'package:news_app/core/entites/article_entity.dart';
import 'package:news_app/core/models/article_model.dart';
import 'package:news_app/core/services/hive_service.dart';
import 'package:news_app/features/home/presentation/widgets/custome_details_icon_button.dart';
import 'package:news_app/features/saved/presentation/manager/article_saved_cubit/saved_article_cubit.dart';

class CustomDetailsAppbar extends StatefulWidget {
  const CustomDetailsAppbar({super.key, required this.article});
  final ArticleEntity article;

  @override
  State<CustomDetailsAppbar> createState() => _CustomDetailsAppbarState();
}

class _CustomDetailsAppbarState extends State<CustomDetailsAppbar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomeDetailsIconButton(
          icon: FontAwesomeIcons.chevronLeft,
          onTap: () {
            Navigator.pop(context);
          },
        ),

        Row(
          children: [
            BlocBuilder<SavedArticleCubit, SavedArticleState>(
              builder: (context, state) {
                bool isSaved = HiveService.isArticleSaved(
                  widget.article.title ?? '',
                );
                return CustomeDetailsIconButton(
                  icon: isSaved
                      ? FontAwesomeIcons.solidBookmark
                      : FontAwesomeIcons.bookmark,
                  onTap: () {
                    setState(() {
                      getIt.get<SavedArticleCubit>().toggleSaved(
                        ArticleModel.fromEntity(widget.article),
                      );
                    });
                  },
                );
              },
            ),
            SizedBox(width: 15),

            CustomeDetailsIconButton(
              icon: FontAwesomeIcons.ellipsis,
              onTap: () {},
            ),
          ],
        ),
      ],
    );
  }
}
