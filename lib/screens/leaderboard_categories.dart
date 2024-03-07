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
  List<Icon> icons= [
    Icon(Icons.phone_android,color: Colors.white,size:40),
    Icon(Icons.style,color: Colors.white,size:40),
    Icon(Icons.local_grocery_store,color: Colors.white,size:40),
    Icon(Icons.local_pharmacy,color: Colors.white,size:40),
    Icon(Icons.toys,color: Colors.white,size:40),
    Icon(Icons.sports,color: Colors.white,size:40),
    Icon(Icons.book,color: Colors.white,size:40),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.teal,
        title: Center(
          child: Text("Categories"),
        ),
      ),
      body: Container(
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
                    color: Colors.teal.shade300,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        icons[index],
                        Text(

                          categories[index].value,
                          style: GoogleFonts.inter(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey.shade200),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
