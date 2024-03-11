import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resono/utlis/font_size.dart';

//Padding + Margin
const paddingOrMargin20 = EdgeInsets.all(20);
const paddingOrMargin15 = EdgeInsets.all(15);
const size=Size.fromHeight(50.0);

TextTheme textTheme = TextTheme(
  displayLarge: GoogleFonts.roboto( /// use for logo text
      fontSize: fontSize(size: 20.0), fontWeight: FontWeight.w700, ),
  displayMedium: GoogleFonts.roboto( /// use for header large and bold text
    fontSize: fontSize(size: 15.0), fontWeight: FontWeight.w700, color: Colors.black,),
  displaySmall: GoogleFonts.roboto( /// user for large non-bold text
      fontSize: fontSize(size: 11.0), fontWeight: FontWeight.w700,),
  headlineMedium: GoogleFonts.roboto( ///use for normal text
      fontSize: fontSize(size: 8.0), fontWeight: FontWeight.w500, letterSpacing: 0.25,),
  headlineSmall: GoogleFonts.roboto(fontSize: 23, fontWeight: FontWeight.w400),
  titleLarge: GoogleFonts.roboto(
      fontSize: fontSize(size: 9.0), fontWeight: FontWeight.w500, letterSpacing: 0.15),
  titleMedium: GoogleFonts.roboto( /// user for light text
      fontSize: fontSize(size: 8.0), fontWeight: FontWeight.w300, color: Colors.black),
  titleSmall: GoogleFonts.roboto( /// user for input text
      fontSize: fontSize(size: 9), fontWeight: FontWeight.w500, color: Colors.black),
  bodyLarge: GoogleFonts.poppins(
      fontSize: fontSize(size: 7.0), fontWeight: FontWeight.w400, letterSpacing: 0.5),
  bodyMedium: GoogleFonts.poppins(
      fontSize: fontSize(size: 6.0), fontWeight: FontWeight.w400, letterSpacing: 0.25),
  labelLarge: GoogleFonts.poppins(
    fontSize: fontSize(size: 10.0),
    fontWeight: FontWeight.w500,
    color: const Color.fromARGB(255, 19, 143, 120),
    backgroundColor: const Color.fromARGB(255, 19, 143, 120),
  ),
  bodySmall:GoogleFonts.poppins(
      fontSize: fontSize(size: 7.0), fontWeight: FontWeight.w300, letterSpacing: 0.25,),
 /* caption: GoogleFonts.poppins(
      fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4),*/
  labelSmall: GoogleFonts.poppins(
      fontSize: fontSize(size: 5.0), fontWeight: FontWeight.w400, letterSpacing: 1.5),
);

ButtonStyle btnStyle(Color txtColor, Color bgColor ) {
  return ButtonStyle(
      foregroundColor:MaterialStateProperty.all(txtColor) ,
      backgroundColor:MaterialStateProperty.all(bgColor),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),

          )
      )
  );
}