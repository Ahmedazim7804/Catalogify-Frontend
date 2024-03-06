import 'package:flutter/material.dart';
import "package:google_fonts/google_fonts.dart";
import 'package:inno_hack/utilities/constants.dart';
import 'package:inno_hack/core/constants.dart';

class SingleProduct extends StatelessWidget {
  SingleProduct(
      {required this.title,
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
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      onClosing: () {},
      builder: (context) => Container(
        height: MediaQuery.sizeOf(context).height / 1.5,
        width: MediaQuery.sizeOf(context).width,
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          children: [
            Container(
              height: 64,
              width: 64,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  border: Border.all(color: Colors.black),
                  color: const Color.fromARGB(255, 226, 181, 31)),
              child: Image.network("")
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: GoogleFonts.urbanist(
                    color: Colors.black,
                    fontSize: 32,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              '$price Rs',
              style: kNormalTextStyle,
            ),
            const SizedBox(
              height: 5,
            ),
            const SizedBox(
              height: 8,
            ),
            Expanded(
              child: Container(
                width: MediaQuery.sizeOf(context).width,
                margin: const EdgeInsets.symmetric(horizontal: 24),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                color: Colors.grey.shade200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Brand",
                            style: GoogleFonts.urbanist(
                                color: const Color(0xFF616161),
                                fontSize: 16,
                                fontWeight: FontWeight.w500)),
                        Text(
                          "$brand",
                          style: GoogleFonts.urbanist(
                              color: const Color(
                                0xFF424242,
                              ),
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Return Period",
                            style: GoogleFonts.urbanist(
                                color: const Color(0xFF616161),
                                fontSize: 16,
                                fontWeight: FontWeight.w500)),
                        Text(
                          "$returnPeriod"+ " days",
                          style: GoogleFonts.urbanist(
                              color: const Color(
                                0xFF424242,
                              ),
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Warranty",
                            style: GoogleFonts.urbanist(
                                color: const Color(0xFF616161),
                                fontSize: 16,
                                fontWeight: FontWeight.w500)),
                        Text(
                          "$warranty"+ "years",
                          style: GoogleFonts.urbanist(
                              color: const Color(
                                0xFF424242,
                              ),
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Description",
                            style: GoogleFonts.urbanist(
                                color: const Color(0xFF616161),
                                fontSize: 16,
                                fontWeight: FontWeight.w500)),
                        Text(
                          description.toString().substring(0,20),

                          style: GoogleFonts.urbanist(
                              color: const Color(
                                0xFF424242,
                              ),
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("State",
                            style: GoogleFonts.urbanist(
                                color: const Color(0xFF616161),
                                fontSize: 16,
                                fontWeight: FontWeight.w500)),
                        Text(
                          "$state",
                          style: GoogleFonts.urbanist(
                              color: const Color(
                                0xFF424242,
                              ),
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),

                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
