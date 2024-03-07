import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inno_hack/core/constants.dart';
import 'package:inno_hack/data/post_endpoints.dart';
import 'package:inno_hack/data/user_endpoints.dart';
import 'package:inno_hack/models/catalog.dart';
import 'package:inno_hack/screens/widgets/SingleProduct.dart';
import "package:inno_hack/utilities/constants.dart";
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:lottie/lottie.dart';

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
        enableDrag: false,
        showDragHandle: false,
        isScrollControlled: true,
        builder: (context) => const Text('data'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),
          color: Colors.white,
        ),
        title: const Text(
          "Leaderboard",
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: FutureBuilder(
          future: getLeaderBoard(widget.category.value),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data.length == 0) {
                return Center(
                  child: Column(
                    children: [
                      LottieBuilder.asset('assets/lottie/employee_search.json'),
                      Text(
                        "No catalogs found",
                        style: GoogleFonts.inter(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                );
              }

              final List<Catalog> catalogs = [];

              for (final unparsedPost in snapshot.data) {
                Catalog catalog = Catalog(
                    postId: unparsedPost['id'],
                    title: unparsedPost['data']['title'],
                    price: (unparsedPost['data']['cost'] as double).toInt(),
                    category:
                        Categories.fromValue(unparsedPost['data']['category']),
                    description: unparsedPost['data']['description'],
                    brand: unparsedPost['data']['brand'],
                    warranty: unparsedPost['data']['warranty_yrs'],
                    returnPeriod: unparsedPost['data']['return_days'],
                    state: unparsedPost['data']['seller_location'],
                    images: unparsedPost['data']['images']);

                catalogs.add(catalog);
              }

              return ListView.builder(
                itemCount: snapshot.data.length, // Number of items in the list
                itemBuilder: (BuildContext context, int index) {
                  return LeaderBoardWidget(
                    catalog: catalogs[index],
                    index: index,
                    likes: snapshot.data[index]['likes'],
                    score: snapshot.data[index]['score'],
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

class LeaderBoardWidget extends StatefulWidget {
  const LeaderBoardWidget(
      {super.key,
      required this.catalog,
      required this.index,
      required this.likes,
      required this.score});

  final Catalog catalog;
  final int likes;
  final int score;
  final int index;

  @override
  State<LeaderBoardWidget> createState() => _LeaderBoardWidgetState();
}

class _LeaderBoardWidgetState extends State<LeaderBoardWidget> {
  bool upvoted = false;
  bool downvoted = false;
  late int likes = widget.likes;

  void _showDetailedInfo() {
    showModalBottomSheet(
        useSafeArea: true,
        enableDrag: false,
        context: context,
        isScrollControlled: true,
        builder: (context) => SingleProduct(catalog: widget.catalog));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _showDetailedInfo,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
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
                (widget.index + 1).toString(),
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
                    leading: Image.asset('assets/images/default_user.png'),
                    title: Text(widget.catalog.title,
                        overflow: TextOverflow.ellipsis,
                        style: kLargeTextStyle),
                    subtitle: Text(
                      widget.catalog.description,
                      overflow: TextOverflow.ellipsis,
                      style: kNormalTextStyle,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Text(
                                  "Score: ",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(widget.score.toString())
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Text(
                                  "Likes: ",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text("$likes".toString())
                              ],
                            ),
                          ],
                        ),
                        const Spacer(),
                        IconButton(
                            onPressed: () {
                              if (!upvoted) {
                                setState(() {
                                  upvoted = true;
                                  downvoted = false;
                                  likes++;
                                });
                                addLike(widget.catalog.postId!);
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    upvoted ? Colors.orange : Colors.grey),
                            icon: const Icon(Icons.arrow_upward)),
                        IconButton(
                            onPressed: () {
                              if (!downvoted) {
                                setState(() {
                                  upvoted = false;
                                  downvoted = true;
                                  likes--;
                                });
                                addDisLike(widget.catalog.postId!);
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    downvoted ? Colors.orange : Colors.grey),
                            icon: const Icon(Icons.arrow_downward))
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
  }
}
