import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lottie/lottie.dart';
import 'package:treecredz_admin/presentation/animations/show_up.dart';
import 'package:treecredz_admin/presentation/screens/main/container_screen.dart';
import 'package:treecredz_admin/presentation/widgets/title.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool _isLoading = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<void> _signInWithGoogle(BuildContext context) async {
    try {
      setState(() {
        _isLoading = true;
      });
      final GoogleSignInAccount googleSignInAccount =
          await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      final UserCredential authResult =
          await _auth.signInWithCredential(credential);
      final User user = authResult.user;

      if (user != null) {
        final User currentUser = _auth.currentUser;
        print(currentUser.email);
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => ContainerScreen(),
          ),
          (route) => false,
        );
        setState(() {
          _isLoading = false;
        });
      }
    } catch (err) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            ShowUp(
              delay: Duration(milliseconds: 200),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(8),
                      child: TitleWidget(),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: MediaQuery.of(context).size.height / 2.5,
                      alignment: Alignment.centerRight,
                      child: LottieBuilder.asset(
                        'assets/lottie/tree_anim.json',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 3.5),
            ShowUp(
              delay: Duration(milliseconds: 800),
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width * 0.6,
                child: RaisedButton(
                  onPressed: () async {
                    if (!_isLoading) {
                      await _signInWithGoogle(context);
                    }
                  },
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: (!_isLoading)
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('Login with Google'),
                            SizedBox(
                              width: 20,
                            ),
                            Image.asset(
                              "assets/images/g_logo.png",
                              fit: BoxFit.contain,
                              height: 24,
                            )
                          ],
                        )
                      : Container(
                          height: 35,
                          width: 35,
                          child: CircularProgressIndicator(),
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
