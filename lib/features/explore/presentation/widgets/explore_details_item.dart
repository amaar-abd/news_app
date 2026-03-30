import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/core/entites/article_entity.dart';
import 'package:news_app/core/routing/app_routes.dart';

class ExploreDetailsItem extends StatelessWidget {
  const ExploreDetailsItem({super.key, required this.article});
  final ArticleEntity article;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          AppRoutes.articleDetailsView,
          arguments: article,
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                article.urlToImage ?? 'https://via.placeholder.com/400x200',
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Text(
                  (article.source!.name ?? 'news').toUpperCase(),
                  style: GoogleFonts.cairo(
                    color: Colors.blueAccent,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.1,
                  ),
                ),
                const SizedBox(width: 8),
                const Text(
                  '•',
                  style: TextStyle(color: Colors.grey, fontSize: 20),
                ),
                const SizedBox(width: 8),
                Text(
                  article.publishedAt!
                      .substring(0, 10)
                      .split('-')
                      .reversed
                      .join('-'),
                  style: GoogleFonts.cairo(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
            const SizedBox(height: 8),

            Text(
              article.title ?? 'No Title Available',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.cairo(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                height: 1.3,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),

            Text(
              article.description ??
                  'No description provided for this article...',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.cairo(
                fontSize: 14,
                color: Colors.grey[600],
                height: 1.4,
              ),
            ),
            const SizedBox(height: 12),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  ' ago',
                  style: GoogleFonts.cairo(color: Colors.grey, fontSize: 12),
                ),
                const Icon(
                  Icons.bookmark_border,
                  size: 20,
                  color: Colors.black87,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
