import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:treecredz_admin/presentation/animations/show_up.dart';
import 'package:treecredz_admin/presentation/screens/landing/auth_screen.dart';
import 'package:treecredz_admin/presentation/themes/theme.dart';
import 'package:treecredz_admin/presentation/widgets/small_title.dart';

class ProfileScreen extends StatelessWidget {
  final _user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 30),
        Container(
          margin: EdgeInsets.all(18),
          child: SmallTitleWidget(),
        ),
        Expanded(
          child: ShowUp(
            delay: Duration(milliseconds: 100),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height / 9),
                CircleAvatar(
                  radius: 68,
                  backgroundColor: mediumGreen,
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: CachedNetworkImageProvider(_user.photoURL),
                  ),
                ),
                SizedBox(height: 56),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    "${_user.displayName}\n(Admin)",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    _user.email,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 64),
                    alignment: Alignment.bottomCenter,
                    child: InkWell(
                      child: Text(
                        "Log Out? You will be missed!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: darkGreen,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: () {
                        FirebaseAuth.instance.signOut();
                        GoogleSignIn().signOut();
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AuthScreen(),
                          ),
                          (route) => false,
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
