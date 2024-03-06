import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

class RootScaffold extends StatelessWidget {
  final Widget child;

  const RootScaffold({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        title: Center(
          child: Text(
            "Innohacks",
            style: GoogleFonts.exo2(),
          ),
        ),
      ),
      body: child,
    ));
  }
}
