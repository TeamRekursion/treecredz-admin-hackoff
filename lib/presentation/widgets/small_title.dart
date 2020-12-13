import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:treecredz_admin/presentation/themes/theme.dart';

class SmallTitleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          child: AutoSizeText(
            "Tree",
            maxLines: 1,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: mediumGreen,
            ),
          ),
        ),
        Container(
          child: AutoSizeText(
            "Credz",
            maxLines: 1,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: Color(0xFF545454),
            ),
          ),
        ),
      ],
    );
  }
}
