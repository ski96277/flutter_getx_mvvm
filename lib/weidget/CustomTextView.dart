import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class CustomTextView extends StatelessWidget {
   TextStyle? style;
   int? maxLine;
   String? text;


  CustomTextView({this.text,this.style, this.maxLine = 1});

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text??'',
      style: style??const TextStyle(fontSize: 20),
      maxLines: maxLine,
    );
  }
}
