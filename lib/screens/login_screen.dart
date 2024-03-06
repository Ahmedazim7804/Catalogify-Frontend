import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:inno_hack/utilities/constants.dart";
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

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
        context.read<UidProvider>().uid = userCredential.user!.uid;

        if (userCredential.additionalUserInfo!.isNewUser) {
          context.go(
            '/screens/authentication/other',
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
      child: Scaffold(
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Image(
                  image: NetworkImage(
                      "https://th.bing.com/th/id/OIP.tMHR6LMDGRzKQ-382IoefAHaEK?rs=1&pid=ImgDetMain"),
                ),
              ),
              Container(
                child: Text("Let's Get Started!",
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.w900, fontSize: 35)),
              ),
              Container(
                padding: EdgeInsets.only(left: 12, right: 12),
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
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(  Radius.circular(32))),
                  selectedTileColor: Colors.orange[100],


                  leading: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image(
                      width: 60,
                      image: NetworkImage("https://clipground.com/images/google-logo-clipart-transparent.png")
                    ),
                  ),
                  title: Center(child: Text("Continue With Google", style: GoogleFonts.inter(fontWeight: FontWeight.w600, fontSize: 17))),
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                      Text("Privacy Policy", style: kNormalTextStyle,),
                    Text("Terms of Services")
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
