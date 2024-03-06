import 'dart:io';

import 'package:flutter/material.dart';
import "package:google_fonts/google_fonts.dart";
import 'package:inno_hack/models/catalog.dart';
import 'package:inno_hack/screens/widgets/heading_text.dart';
import 'package:inno_hack/utilities/constants.dart';
import 'package:inno_hack/core/constants.dart';
import 'package:carousel_slider/carousel_slider.dart';

class SingleProduct extends StatelessWidget {
  const SingleProduct({super.key, required this.catalog});

  final Catalog catalog;

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      onClosing: () {},
      builder: (context) => Container(
        height: MediaQuery.sizeOf(context).height / 1.5,
        width: MediaQuery.sizeOf(context).width,
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Stack(children: [
                  catalog.images.length == 1
                      ? Image.network(
                          catalog.images[0],
                          height: 128,
                          width: 128,
                        )
                      : CarouselSlider.builder(
                          itemCount: catalog.images.length,
                          itemBuilder: (context, index, realIndex) =>
                              Image.network(
                                catalog.images[index],
                                height: 256,
                                width: 256,
                              ),
                          options: CarouselOptions()),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  catalog.title,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.urbanist(
                      color: Colors.black,
                      fontSize: 32,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                '₹${catalog.price}',
                style: kLargeTextStyle,
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
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
                          catalog.brand,
                          style: GoogleFonts.urbanist(
                              color: const Color(
                                0xFF424242,
                              ),
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
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
                          catalog.category.value,
                          style: GoogleFonts.urbanist(
                              color: const Color(
                                0xFF424242,
                              ),
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
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
                          "${catalog.returnPeriod} days",
                          style: GoogleFonts.urbanist(
                              color: const Color(
                                0xFF424242,
                              ),
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
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
                          "${catalog.warranty} years",
                          style: GoogleFonts.urbanist(
                              color: const Color(
                                0xFF424242,
                              ),
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
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
                          catalog.state,
                          style: GoogleFonts.urbanist(
                              color: const Color(
                                0xFF424242,
                              ),
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(
                      thickness: 1,
                      color: Colors.black,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const HeadingText(text: "Description"),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(catalog.description)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
