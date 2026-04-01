import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/core/constants/app_colors.dart';
import 'package:news_app/core/entites/article_entity.dart';
import 'package:news_app/core/routing/app_routes.dart';
import 'package:news_app/core/utils/app_iamges.dart';

class SavedItem extends StatelessWidget {
  final ArticleEntity article;
  final VoidCallback onDelete;

  const SavedItem({super.key, required this.article, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: Colors.grey.shade100,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      shadowColor: Colors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(16),
                ),
                child: CachedNetworkImage(
                  imageUrl: article.urlToImage ?? '',
                  errorWidget: (context, url, error) => Image.asset(
                    Assets.assetsImagesNoImage,
                    fit: BoxFit.cover,
                  ),
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

              Positioned(
                top: 8,
                right: 8,
                child: CircleAvatar(
                  backgroundColor: Colors.grey.shade100,
                  radius: 17,
                  child: IconButton(
                    icon: FaIcon(
                      FontAwesomeIcons.trash,
                      size: 17.2,
                      color: AppColors.errorColor,
                    ),
                    onPressed: onDelete,
                  ),
                ),
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  article.title ?? "No Title",
                  style: GoogleFonts.cairo(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Text(
                  article.description ?? "",
                  style: GoogleFonts.cairo(
                    color: Colors.grey[600],
                    fontSize: 14,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${article.publishedAt?.substring(0, 10) ?? ""} ",
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context, rootNavigator: true).pushNamed(
                          AppRoutes.articleDetailsView,
                          arguments: article,
                        );
                      },
                      child: Row(
                        children: [
                          Text(
                            "Read More",
                            style: GoogleFonts.cairo(
                              color: AppColors.primaryColors,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Icon(Icons.arrow_forward, size: 16),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
