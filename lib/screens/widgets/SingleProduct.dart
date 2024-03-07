import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import "package:google_fonts/google_fonts.dart";
import 'package:inno_hack/data/post_endpoints.dart';
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
        child: FutureBuilder(
          future: getPostAssessment(catalog.postId!),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.teal,
                ),
              );
            }

            final data = snapshot.data;
            (data['assessment2'] as List<dynamic>).add(1);

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                              itemBuilder: (context, index, realIndex) => Stack(
                                    children: [
                                      Image.network(
                                        catalog.images[index],
                                        height: 256,
                                        width: 256,
                                      ),
                                      (data['assessment2'] as List<dynamic>)
                                              .contains(index)
                                          ? Positioned(
                                              top: 30,
                                              child: Image.asset(
                                                'assets/images/declined.png',
                                                width: 24,
                                                height: 24,
                                              ))
                                          : const SizedBox.shrink()
                                    ],
                                  ),
                              options: CarouselOptions()),
                    ]),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  data['assessment4'] == true
                      ? const SizedBox.shrink()
                      : Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: const BoxDecoration(
                                color: Colors.red,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4))),
                            child: Text(
                              "Dangerous",
                              style: GoogleFonts.urbanist(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
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
                          children: [
                            Text("Title",
                                style: GoogleFonts.urbanist(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600)),
                            const Spacer(),
                            Text(
                              catalog.title,
                              style: GoogleFonts.urbanist(
                                  color: const Color(
                                    0xFF424242,
                                  ),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            data['assessment1'] == true
                                ? SvgPicture.asset('assets/images/icon.svg')
                                : Image.asset(
                                    'assets/images/declined.png',
                                    width: 24,
                                    height: 24,
                                  )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Price",
                                style: GoogleFonts.urbanist(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600)),
                            const Spacer(),
                            Text(
                              catalog.price.toString(),
                              style: GoogleFonts.urbanist(
                                  color: const Color(
                                    0xFF424242,
                                  ),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SvgPicture.asset('assets/images/icon.svg')
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Brand",
                                style: GoogleFonts.urbanist(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600)),
                            const Spacer(),
                            Text(
                              catalog.brand,
                              style: GoogleFonts.urbanist(
                                  color: const Color(
                                    0xFF424242,
                                  ),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SvgPicture.asset('assets/images/icon.svg')
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
                            const Spacer(),
                            Text(
                              catalog.category.value,
                              style: GoogleFonts.urbanist(
                                  color: const Color(
                                    0xFF424242,
                                  ),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SvgPicture.asset('assets/images/icon.svg')
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
                            const Spacer(),
                            Text(
                              "${catalog.returnPeriod} days",
                              style: GoogleFonts.urbanist(
                                  color: const Color(
                                    0xFF424242,
                                  ),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SvgPicture.asset('assets/images/icon.svg')
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
                            const Spacer(),
                            Text(
                              "${catalog.warranty} years",
                              style: GoogleFonts.urbanist(
                                  color: const Color(
                                    0xFF424242,
                                  ),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SvgPicture.asset('assets/images/icon.svg')
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
                            const Spacer(),
                            Text(
                              catalog.state,
                              style: GoogleFonts.urbanist(
                                  color: const Color(
                                    0xFF424242,
                                  ),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SvgPicture.asset('assets/images/icon.svg')
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
                        Row(
                          children: [
                            SizedBox(
                              width: MediaQuery.sizeOf(context).width - 100,
                              child: Text(
                                catalog.description,
                              ),
                            ),
                            const Spacer(),
                            (data['assessment3'] == true &&
                                    data['assessment3'] == true)
                                ? SvgPicture.asset('assets/images/icon.svg')
                                : Image.asset(
                                    'assets/images/declined.png',
                                    width: 24,
                                    height: 24,
                                  )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
