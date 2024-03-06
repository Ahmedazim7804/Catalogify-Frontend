import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:go_router/go_router.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import "package:inno_hack/bloc/catalog_cubits.dart";

class RootScaffold extends StatefulWidget {
  const RootScaffold({super.key, required this.child});

  final Widget child;

  @override
  State<RootScaffold> createState() => _RootScaffoldState();
}

class _RootScaffoldState extends State<RootScaffold> {
  int _selectedIndex = 0;
  late final CatalogCubit catalogCubit = CatalogCubit();

  void onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 0) {
      context.go("/home_page");
    } else if (index == 1) {
      context.go("/leaderboard_screen");
    } else if (index == 2) {
      context.go("/profile_screen");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => catalogCubit,
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          foregroundColor: Colors.white,
          title: Center(
            child: Text(
              "InnoHacks",
              style: GoogleFonts.exo2(),
            ),
          ),
        ),
        body: widget.child,
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: onItemTapped,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.star), label: "LeaderBoard"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle), label: "Profile"),
            ]),
      ),
    );
  }
}
