import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inno_hack/core/constants.dart';
import 'package:inno_hack/data/user_endpoints.dart';
import 'package:inno_hack/models/catalog.dart';
import 'package:inno_hack/screens/widgets/SingleProduct.dart';
import "package:inno_hack/utilities/constants.dart";
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class LeaderBoardScreen extends StatefulWidget {
  const LeaderBoardScreen({super.key, required this.category});
  final Categories category;

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
      body: FutureBuilder(
          future: getLeaderBoard(widget.category.value),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              // final List<Catalog> catalogs = [];
              print(snapshot.data[1]['score']);
              // for (final unparsedPost in snapshot.data) {
              //   Catalog catalog = Catalog(
              //       postId: unparsedPost['id'],
              //       title: unparsedPost['data']['title'],
              //       price: 200,
              //       // price: (unparsedPost['data']['cost'] as double).toInt(),
              //       category:
              //           Categories.fromValue(unparsedPost['data']['category']),
              //       description: unparsedPost['data']['description'],
              //       brand: "NOTHING",
              //       // brand: unparsedPost['brand'],
              //       // warranty: unparsedPost['warranty_yrs'],
              //       warranty: 11,
              //       // returnPeriod: unparsedPost['return_days'],
              //       returnPeriod: 11,
              //       state: unparsedPost['seller_location'],
              //       images: unparsedPost['images']);

              //   catalogs.add(catalog);
              // }

              return ListView.builder(
                itemCount: snapshot.data.length, // Number of items in the list
                itemBuilder: (BuildContext context, int index) {
                  bool upvoted = false;
                  bool downvoted = false;

                  return GestureDetector(
                    onTap: () {
                      _showsingleproduct();
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 5),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            height: 125,
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
                            height: 125,
                            width: MediaQuery.sizeOf(context).width - 60,
                            color: Colors.grey.shade200,
                            child: Column(
                              children: [
                                ListTile(
                                  leading: Image.asset(
                                      'assets/images/default_user.png'),
                                  title: Text(
                                      snapshot.data[index]['data']['title'],
                                      overflow: TextOverflow.ellipsis,
                                      style: kLargeTextStyle),
                                  subtitle: Text(
                                    snapshot.data[index]['data']['description'],
                                    overflow: TextOverflow.ellipsis,
                                    style: kNormalTextStyle,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              const Text(
                                                "Score: ",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(snapshot.data[index]['score']
                                                  .toString())
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              const Text(
                                                "Likes: ",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                  "${snapshot.data[index]['likes']}"
                                                      .toString())
                                            ],
                                          ),
                                        ],
                                      ),
                                      const Spacer(),
                                      IconButton(
                                          onPressed: () {},
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.grey),
                                          icon: const Icon(Icons.arrow_upward)),
                                      IconButton(
                                          onPressed: () {},
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.grey),
                                          icon:
                                              const Icon(Icons.arrow_downward))
                                    ],
                                  ),
                                ),
                              ],
                            ),

                            //
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.teal,
                ),
              );
            }
          }),
    );
  }
}
