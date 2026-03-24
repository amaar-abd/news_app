import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_app/features/home/presentation/widgets/custom_icon_button.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //bars
        CustomIconButton(icon: FontAwesomeIcons.barsStaggered, onTap: () {}),

        Row(
          children: [
            CustomIconButton(
              icon: FontAwesomeIcons.magnifyingGlass,
              onTap: () {},
            ),
            SizedBox(width: 15),

            CustomIconButton(icon: FontAwesomeIcons.bell, onTap: () {}),
          ],
        ),
      ],
    );
  }
}
