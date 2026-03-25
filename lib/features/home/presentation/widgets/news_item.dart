import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/core/constants/app_colors.dart';
import 'package:news_app/core/utils/app_iamges.dart';
import 'package:news_app/features/home/domain/entities/article_entity.dart';

class NewsItem extends StatelessWidget {
  const NewsItem({super.key, required this.article});
  final ArticleEntity article;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 120,
          width: 120,
          child: DecoratedBox(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  spreadRadius: 1,
                  blurRadius: 10,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                imageUrl: article.urlToImage ?? '',
                fit: BoxFit.cover,
                errorWidget: (context, url, error) => Image.asset(
                  Assets.assetsImagesNoImage,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              article.source!.name ?? '',
              style: GoogleFonts.cairo(
                color: AppColors.secondColors,
                fontSize: 12,
              ),
            ),
            SizedBox(height: 7),
            SizedBox(
              width: 250,
              child: Text(
                article.title ?? '',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.cairo(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 7),

            Row(
              children: [
                Text(
                  (article.author ?? '').trim().split(' ').take(2).join(' '),
                  style: GoogleFonts.cairo(
                    color: AppColors.secondColors,
                    fontSize: 12,
                    
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  article.publishedAt!
                      .substring(0, 10)
                      .split('-')
                      .reversed
                      .join('-'),
                  style: GoogleFonts.cairo(
                    color: AppColors.secondColors,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
