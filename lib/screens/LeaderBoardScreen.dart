import 'package:flutter/material.dart';
import 'package:inno_hack/core/constants.dart';
import 'package:inno_hack/screens/widgets/SingleProduct.dart';
import "package:inno_hack/utilities/constants.dart";
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class LeaderBoardScreen extends StatefulWidget {
  const LeaderBoardScreen({super.key});

  @override
  State<LeaderBoardScreen> createState() => _LeaderBoardScreenState();
}

class _LeaderBoardScreenState extends State<LeaderBoardScreen> {
  void _showsingleproduct() {
    showModalBottomSheet(
        useSafeArea: true,
        context: context,
        isScrollControlled: true,
        builder: (context) => SingleProduct(title: 'title', price: 20, category: Categories.books, description: "description is this khushal bhasin", brand: "brand", warranty: 20, returnPeriod: 20, state: "state", userId: "userId", images: []));
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: 20, // Number of items in the list
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: (){
              _showsingleproduct();
            },
            child: Card(
                child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text((index + 1).toString()),
                  // SizedBox(width: 30),
                  Row(
                    children: [
                      CircleAvatar(
                        child: Image.network(
                            "https://th.bing.com/th/id/OIP.eGHa3HgHxIlTHmcvKNDs7AHaGe?rs=1&pid=ImgDetMain"),
                      ),
                      Column(
                        children: [
                          Text("This is title", style: kLargeTextStyle),
                          Text(
                            "this is description",
                            style: kNormalTextStyle,
                          )
                        ],
                      ),
                    ],
                  ),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 80,
                        height: 20,
                        child: RatingBar.builder(
                          initialRating: 3,
                          minRating: 1,
                          itemSize: 15,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 2,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                      ),
                      Text("1.6k👍")
                    ],
                  ),
                ],
              ),
            )),
          );
        },
      ),
    );
  }
}
