import 'dart:io';

import 'package:flutter/material.dart';
import "package:google_fonts/google_fonts.dart";
import 'package:inno_hack/screens/widgets/heading_text.dart';
import 'package:inno_hack/utilities/constants.dart';
import 'package:inno_hack/core/constants.dart';
import 'package:carousel_slider/carousel_slider.dart';

class SingleProduct extends StatelessWidget {
  const SingleProduct(
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
            Center(
              child: Stack(children: [
                images.length == 1
                    ? Image.file(
                        File(images[0]),
                        height: 128,
                        width: 128,
                      )
                    : CarouselSlider.builder(
                        itemCount: images.length,
                        itemBuilder: (context, index, realIndex) => Image.file(
                              File(images[index]),
                              height: 128,
                              width: 128,
                            ),
                        options: CarouselOptions()),
              ]),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "T-Shirt",
                textAlign: TextAlign.center,
                style: GoogleFonts.urbanist(
                    color: Colors.black,
                    fontSize: 32,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              '₹$price',
              style: kLargeTextStyle,
            ),
            const SizedBox(
              height: 8,
            ),
            Expanded(
              child: Container(
                width: MediaQuery.sizeOf(context).width,
                margin: const EdgeInsets.symmetric(horizontal: 16),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.teal.shade100,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Brand",
                            style: GoogleFonts.urbanist(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w600)),
                        Text(
                          brand,
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
                        Text("Category",
                            style: GoogleFonts.urbanist(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w600)),
                        Text(
                          category.value,
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
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w500)),
                        Text(
                          "$returnPeriod days",
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
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w500)),
                        Text(
                          "$warranty years",
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
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w500)),
                        Text(
                          state,
                          style: GoogleFonts.urbanist(
                              color: const Color(
                                0xFF424242,
                              ),
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    const Divider(
                      thickness: 1,
                      color: Colors.black,
                    ),
                    const HeadingText(text: "Description"),
                    Text(description)
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
