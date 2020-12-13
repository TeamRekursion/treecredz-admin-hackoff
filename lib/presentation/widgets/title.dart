import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:treecredz_admin/presentation/themes/theme.dart';

class TitleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                child: AutoSizeText(
                  "Tree",
                  maxLines: 1,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
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
                    fontSize: 32,
                    color: Color(0xFF545454),
                  ),
                ),
              ),
            ],
          ),
          Container(
            child: AutoSizeText(
              "Admin",
              maxLines: 1,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Color(0xFF545454),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
