import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inno_hack/core/constants.dart';
import 'package:inno_hack/screens/widgets/SingleProduct.dart';
import "package:inno_hack/utilities/constants.dart";
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class LeaderBoardScreen extends StatefulWidget {
  LeaderBoardScreen(
      {super.key,
      required this.title,
      required this.price,
      required this.category,
      required this.description,
      required this.brand,
      required this.warranty,
      required this.returnPeriod,
      required this.state,
      required this.userId,
      required this.images});
  final String title;
  final String userId;
  final int price;
  final Categories category;
  final String description;
  final String brand;
  final int warranty;
  final int returnPeriod;
  final String state;
  List<String> images;

  @override
  State<LeaderBoardScreen> createState() => _LeaderBoardScreenState();
}

class _LeaderBoardScreenState extends State<LeaderBoardScreen> {
  void _showsingleproduct() {
    showModalBottomSheet(
        useSafeArea: true,
        context: context,
        isScrollControlled: true,
        builder: (context) => const Text('data'));
    // (context) => SingleProduct(title: 'title', price: 20, category: Categories.books, description: "description is this khushal bhasin", brand: "brand", warranty: 20, returnPeriod: 20, state: "state", userId: "userId", images: []))
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 20, // Number of items in the list
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              _showsingleproduct();
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    height: 75,
                    width: 50,
                    decoration: const BoxDecoration(
                        color: Colors.teal,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            topLeft: Radius.circular(20))),
                    alignment: Alignment.center,
                    child: Text(
                      (index + 1).toString(),
                      style: GoogleFonts.inter(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    height: 75,
                    width: MediaQuery.sizeOf(context).width - 60,
                    color: Colors.grey.shade200,
                    child: ListTile(
                      leading: Image.asset('assets/images/default_user.png'),
                      title: Text(widget.title, style: kLargeTextStyle),
                      subtitle: Text(
                        widget.description,
                        overflow: TextOverflow.ellipsis,
                        style: kNormalTextStyle,
                      ),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 80,
                            height: 20,
                            child: RatingBar.builder(
                              initialRating: 3,
                              minRating: 1,
                              itemSize: 15,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemBuilder: (context, _) => const Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 2,
                              ),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            ),
                          ),
                          const Text("1.6k👍")
                        ],
                      ),
                    ),

                    //
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
