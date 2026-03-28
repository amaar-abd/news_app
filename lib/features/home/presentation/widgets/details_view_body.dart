import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/core/utils/app_iamges.dart';
import 'package:news_app/core/entites/article_entity.dart';
import 'package:news_app/features/home/presentation/widgets/custom_details_appbar.dart';

class DetailsViewBody extends StatelessWidget {
  const DetailsViewBody({super.key, required this.article});
  final ArticleEntity article;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl: article.urlToImage ?? '',
          fit: BoxFit.cover,
          height: size.height * 0.5,
          width: double.infinity,
          errorWidget: (context, url, error) => Image.asset(
            Assets.assetsImagesNoImage,
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
        ),
        Positioned(
          top: 10,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: CustomDetailsAppbar(),
          ),
        ),
        Positioned(
          right: 0,
          left: 20,
          top: size.height * 0.35,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 250,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.blue.shade600,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Text(
                      article.title ?? '',
                      maxLines: 2,

                      overflow: TextOverflow.clip,
                      style: GoogleFonts.cairo(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 7),
              Row(
                children: [
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade500,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 4,
                        vertical: 4,
                      ),
                      child: Text(
                        (article.author ?? '')
                            .trim()
                            .split(' ')
                            .take(2)
                            .join(' '),
                        style: GoogleFonts.cairo(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade500,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 4,
                        vertical: 4,
                      ),
                      child: Text(
                        article.publishedAt!
                            .substring(0, 10)
                            .split('-')
                            .reversed
                            .join('-'),
                        style: GoogleFonts.cairo(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 400),
          child: Container(
            height: size.height * 0.50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          article.source!.name ?? '',
                          style: GoogleFonts.cairo(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 4),
                        Image.asset(Assets.assetsImagesCheckMark, width: 20),
                      ],
                    ),
                    SizedBox(height: 20),
                    Text(
                      article.description ?? '',
                      style: GoogleFonts.cairo(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
