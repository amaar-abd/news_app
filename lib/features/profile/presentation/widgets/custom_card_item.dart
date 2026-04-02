import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomCardItem extends StatelessWidget {
  const CustomCardItem({
    super.key,
    required this.title,
    required this.leadingIcon,
    required this.trailing,
  });
  final String title;
  final Widget leadingIcon;
  final Widget trailing;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
        height: 40,
        width: 40,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(child: leadingIcon),
        ),
      ),
      title: Text(title, style: GoogleFonts.cairo(fontSize: 17)),
      trailing: trailing,
    );
  }
}
