import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import "package:google_fonts/google_fonts.dart";
import 'package:inno_hack/provider/user_provider.dart';
import 'package:inno_hack/screens/widgets/overlay_widget.dart';
import "package:inno_hack/utilities/constants.dart";
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  bool dialogShowing = false;
  final OverlayPortalController overlayPortalController =
      OverlayPortalController();

  void signInWithGoogle() async {
    overlayPortalController.show();
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleSignInAccount?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      FirebaseAuth.instance
          .signInWithCredential(credential)
          .then((userCredential) {
        context.read<UserProvider>().uid = userCredential.user!.uid;
        context.read<UserProvider>().email = userCredential.user!.email!;

        if (userCredential.additionalUserInfo!.isNewUser) {
          context.go(
            '/other_details',
          );
          overlayPortalController.hide();
        } else {
          overlayPortalController.hide();
        }
      });
    } catch (e) {
      print(e);
      overlayPortalController.hide();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: OverlayPortal(
        controller: overlayPortalController,
        overlayChildBuilder: overlayChildBuilder,
        child: Scaffold(
          appBar: AppBar(
            foregroundColor: Colors.white,
            backgroundColor: Colors.teal,
            title: Center(
                child: Text(
              "CATALOGIFY",
              style: kTitleAppbar,
            )),
          ),
          body: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child:
                      const Image(image: AssetImage("assets/images/icon.png")),
                ),
                Container(
                  child: Text("Let's Get Started!",
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w600, fontSize: 25)),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  child: Text("Unleash Your Selling Potential!",
                      style: kNormalTextStyle),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  child: Text("Unleash Your Selling Potential!",
                      style: kNormalTextStyle),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 12, right: 12),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "dsfldfjdslksjdfldsjfsldfjdslkfdldsjfsdlddlf lsdkjf dlsfj dlfjds flfj sfjlfs flf ldsjf dsjf lds fdsljfdlfj ds",
                      style: GoogleFonts.inter(fontSize: 15),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ListTile(
                    onTap: signInWithGoogle,
                    tileColor: Colors.grey[200],
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32))),
                    selectedTileColor: Colors.orange[100],
                    leading: Image.asset(
                      'assets/images/google.png',
                      height: 32,
                      width: 32,
                    ),
                    title: Center(
                        child: Text("Continue With Google",
                            style: GoogleFonts.inter(
                                fontWeight: FontWeight.w600, fontSize: 17))),
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Privacy Policy",
                        style: kNormalTextStyle,
                      ),
                      const Text("Terms of Services")
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
