import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inno_hack/core/constants.dart';

class LeaderBoardCategories extends StatefulWidget {
  const LeaderBoardCategories({super.key});

  @override
  State<LeaderBoardCategories> createState() => _LeaderBoardCategoriesState();
}

class _LeaderBoardCategoriesState extends State<LeaderBoardCategories> {
  List<Categories> categories = Categories.values;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
        crossAxisCount: 2, // Number of columns
        children: List.generate(categories.length, (index) {
          return InkWell(
            onTap: () =>
                context.pushNamed('leaderboard', extra: categories[index]),
            child: Card(
              elevation: 2,
              margin: const EdgeInsets.all(7),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    categories[index].value,
                    style: GoogleFonts.inter(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.yellow),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
