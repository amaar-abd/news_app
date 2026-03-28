import 'package:flutter/material.dart';
import 'package:news_app/core/constants/app_colors.dart';
import 'package:news_app/features/search/presentation/widgets/trending_item.dart';

class TredingItemsGridView extends StatefulWidget {
  const TredingItemsGridView({super.key, required this.searchController});
  final TextEditingController searchController;

  @override
  State<TredingItemsGridView> createState() => _TredingItemsGridViewState();
}

class _TredingItemsGridViewState extends State<TredingItemsGridView> {
  List<String> trends = [
    "#globalEconomy",
    "#sports",
    "#AI_Revolution",
    "#CyberSecurity",
    "#CryptoCurrency",
  ];
  int activeIndex = -1;
  @override
  void initState() {
    super.initState();
    widget.searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    if (widget.searchController.text.isEmpty) {
      setState(() {
        activeIndex = -1;
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    widget.searchController.removeListener(() => _onSearchChanged);
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 8,
      mainAxisSpacing: 15,
      childAspectRatio: 5,
      children: trends.map((item) {
        return TrendingItem(
          onTap: () {
            setState(() {
              activeIndex = trends.indexOf(item);
              widget.searchController.text = item;
            });
          },
          title: item,
          titleColor: activeIndex == trends.indexOf(item) ? Colors.white : null,
          backgroundColor: activeIndex == trends.indexOf(item)
              ? AppColors.primaryColors
              : null,
        );
      }).toList(),
    );
  }
}
