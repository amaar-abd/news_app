import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/core/constants/app_colors.dart';
import 'package:news_app/core/routing/app_routes.dart';
import 'package:news_app/core/utils/app_iamges.dart';
import 'package:news_app/core/entites/article_entity.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeCarouselSlider extends StatefulWidget {
  const HomeCarouselSlider({super.key, required this.articleEntity});
  final List<ArticleEntity> articleEntity;
  @override
  State<HomeCarouselSlider> createState() => _HomeCarouselSliderState();
}

class _HomeCarouselSliderState extends State<HomeCarouselSlider> {
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: widget.articleEntity.length,
          options: CarouselOptions(
            onPageChanged: (index, reason) {
              setState(() {
                activeIndex = index;
              });
            },
            height: size.height * .23,
            // autoPlay: true,
            enlargeCenterPage: true,
            enlargeStrategy: CenterPageEnlargeStrategy.height,
            viewportFraction: .93,
          ),
          itemBuilder: (context, index, realIndex) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Stack(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context, rootNavigator: true).pushNamed(
                          AppRoutes.articleDetailsView,
                          arguments: widget.articleEntity[index],
                        );
                      },
                      child: CachedNetworkImage(
                        imageUrl: widget.articleEntity[index].urlToImage ?? '',
                        fit: BoxFit.cover,
                        width: double.infinity,
                        placeholder: (context, url) => Container(
                          color: Colors.grey[200],
                          child: const Center(
                            child: CircularProgressIndicator(
                              color: AppColors.primaryColors,
                            ),
                          ),
                        ),
                        errorWidget: (context, url, error) => Image.asset(
                          Assets.assetsImagesNoImage,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 14),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  widget.articleEntity[index].source!.name ??
                                      '',
                                  style: GoogleFonts.cairo(
                                    color: AppColors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                  ),
                                ),
                                SizedBox(width: 4),
                                Image.asset(
                                  Assets.assetsImagesCheckMark,
                                  width: 20,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  widget.articleEntity[index].publishedAt!
                                      .substring(0, 10)
                                      .split('-')
                                      .reversed
                                      .join('-'),
                                  style: GoogleFonts.cairo(
                                    color: AppColors.white,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 2),
                            SizedBox(
                              width: 200,
                              child: Text(
                                widget.articleEntity[index].title ?? '',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.cairo(
                                  color: AppColors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        SizedBox(height: 10),
        AnimatedSmoothIndicator(
          activeIndex: activeIndex,
          count: widget.articleEntity.length,
          effect: ExpandingDotsEffect(
            activeDotColor: AppColors.primaryColors,
            dotColor: AppColors.grey,
            dotHeight: 9,
            dotWidth: 9,
            spacing: 6,
            expansionFactor: 3,
          ),
        ),
      ],
    );
  }
}
