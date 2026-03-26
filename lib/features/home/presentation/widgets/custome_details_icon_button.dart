import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_app/core/constants/app_colors.dart';

class CustomeDetailsIconButton extends StatelessWidget {
  const CustomeDetailsIconButton({
    super.key,
    required this.onTap,
    required this.icon,
  });
  final void Function() onTap;
  final FaIconData icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 40,
        width: 40,
        child: DecoratedBox(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey.shade500.withAlpha(150),
          ),

          child: ClipOval(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Center(child: FaIcon(icon, color: AppColors.white)),
            ),
          ),
        ),
      ),
    );
  }
}
