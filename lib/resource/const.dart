// get size => (context) => MediaQuery.of(context).size;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Size Function(dynamic context) get size =>
    (context) => MediaQuery.of(context).size;

RichText customRichTextTile(
    {required String title,
    required String subtitle,
    TextOverflow textOverflow = TextOverflow.ellipsis}) {
  return RichText(
    // overflow: textOverflow,
    text: TextSpan(
      style: TextStyle(
          color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500),
      children: [
        TextSpan(text: '$title: \n \n'),
        TextSpan(
            text: subtitle,
            style: TextStyle(fontWeight: FontWeight.w600, color: Colors.blue)),
      ],
    ),
  );
}
