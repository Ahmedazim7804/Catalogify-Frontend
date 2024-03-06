import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:go_router/go_router.dart";

class RootScaffold extends StatefulWidget {
  Widget child;

  RootScaffold({super.key, required this.child});

  @override
  State<RootScaffold> createState() => _RootScaffoldState(child: child);
}

class _RootScaffoldState extends State<RootScaffold> {
  Widget child;


  _RootScaffoldState({required this.child});

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Perform actions based on the selected index
    switch (index) {
      case 0:
        context.go("/home_page");
        // Handle first item press
        break;
      case 1:
        print(1);
        context.go("/product_screen");
        // Handle second item press
        break;
      case 2:
        print(2);
      // Add more cases for additional items as needed
    }
  }

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
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.history), label: "Products"),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle), label: "Profile"),
          ]),
    ));
  }
}
