import 'package:flutter/material.dart';
import 'package:hire_me_auto/src/res/text_style.dart';

kText(String text,
    {fontSize = 15, fontWeight = FontWeight.w400, color = Colors.black}) {
  return Text(
    text,
    style: customTextStyle.copyWith(
        fontSize: double.parse((fontSize).toString()),
        fontWeight: fontWeight,
        color: color),
  );
}
