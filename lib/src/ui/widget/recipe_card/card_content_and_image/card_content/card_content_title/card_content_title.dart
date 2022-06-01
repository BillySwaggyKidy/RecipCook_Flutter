import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardContentTitle extends StatelessWidget {
  String title;

  CardContentTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.center,
        child: Text(
          title,
          style: GoogleFonts.ebGaramond(
              textStyle: Theme.of(context).textTheme.headline6),
        ));
  }
}
