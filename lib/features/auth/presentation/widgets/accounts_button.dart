import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountsButton extends StatelessWidget {
  const AccountsButton({super.key, required this.widget, required this.text});
  final Widget widget;
  final String text;
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [BoxShadow(color: Colors.grey.shade400, spreadRadius: 1)],
      ),
      child: SizedBox(
        height: 50,
        width: 150,

        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 35, width: 35, child: widget),
            SizedBox(width: 6),
            Text(
              text,
              style: GoogleFonts.cairo(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
