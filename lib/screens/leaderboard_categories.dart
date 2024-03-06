import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LeaderBoardCategories extends StatefulWidget {
  const LeaderBoardCategories({super.key});

  @override
  State<LeaderBoardCategories> createState() => _LeaderBoardCategoriesState();
}

class _LeaderBoardCategoriesState extends State<LeaderBoardCategories> {
  List<String> categories = [
    'Electronics',
    'Fashion',
    'Grocery',
    'Medicine',
    'Toys',
    'Sports',
    'Books'
  ];


  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
        crossAxisCount: 2, // Number of columns
        children: List.generate(categories.length, (index) {
          return Card(
            elevation: 2,
            margin: EdgeInsets.all(7),
            child: Container(

              decoration:BoxDecoration(
                color: Colors.teal,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  categories[index],
                  style: GoogleFonts.inter(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.yellow),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
