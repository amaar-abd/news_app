import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_app/features/home/presentation/widgets/custome_details_icon_button.dart';

class CustomDetailsAppbar extends StatelessWidget {
  const CustomDetailsAppbar({super.key});

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
            CustomeDetailsIconButton(
              icon: FontAwesomeIcons.bookmark,
              onTap: () {},
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
