import "package:flutter/material.dart";
import "package:flutter_expandable_fab/flutter_expandable_fab.dart";
import "package:google_fonts/google_fonts.dart";
import "package:inno_hack/bloc/catalog_cubits.dart";
import "package:inno_hack/models/catalog.dart";
import "package:inno_hack/screens/widgets/heading_text.dart";
import "package:inno_hack/screens/widgets/product_item.dart";

import "package:go_router/go_router.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import "package:lottie/lottie.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        title: Center(
          child: Text(
            "InnoHacks",
            style: GoogleFonts.exo2(),
          ),
        ),
      ),
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: ExpandableFab(
        openButtonBuilder: RotateFloatingActionButtonBuilder(
            backgroundColor: Colors.teal,
            child: const Icon(
              Icons.add,
              color: Colors.white,
            )),
        closeButtonBuilder: RotateFloatingActionButtonBuilder(
            backgroundColor: Colors.teal,
            child: const Icon(
              Icons.add,
              color: Colors.white,
            )),
        type: ExpandableFabType.up,
        distance: 65,
        children: [
          FloatingActionButton.extended(
            heroTag: 'btn2',
            backgroundColor: Colors.teal,
            onPressed: () => context.push('/add_catalog'),
            label: const Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Icon(
                  Icons.lock_clock,
                  color: Colors.white,
                ),
                Text(
                  " Add",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          FloatingActionButton.extended(
            heroTag: 'btn3',
            backgroundColor: Colors.teal,
            onPressed: () {},
            label: const Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                Text('Import by CSV', style: TextStyle(color: Colors.white))
              ],
            ),
          ),
          FloatingActionButton.extended(
            heroTag: 'btn4',
            backgroundColor: Colors.teal,
            onPressed: () {},
            label: const Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                Text('Import by JSON', style: TextStyle(color: Colors.white))
              ],
            ),
          ),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(30),
              color: Colors.teal,
              height: 200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Hi,\nKhushal Bhasin",
                    style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 19,
                        fontWeight: FontWeight.w600),
                  ),
                  const Spacer(),
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.transparent,
                    backgroundImage:
                        Image.asset('assets/images/default_user.png').image,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        height: 450,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: BlocBuilder<CatalogCubit, CatalogState>(
          builder: (context, state) {
            if (state is CatalogLoading) {
              return const Center(
                  child: CircularProgressIndicator(
                color: Colors.teal,
              ));
            }

            if (state is CatalogEmpty) {
              return Column(
                children: [
                  LottieBuilder.asset(
                    'assets/lottie/no_catalog.json',
                  ),
                  Text(
                    "No Product Available",
                    style: GoogleFonts.inter(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  )
                ],
              );
            }

            if (state is CatalogLoaded) {
              List<Catalog> catalogs = context.read<CatalogCubit>().catalogs;

              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const HeadingText(
                      text: "Your Products",
                      color: Colors.white,
                      size: 18,
                    ),
                    ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: catalogs.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ProductItem(
                            catalog: catalogs[index],
                          );
                        }),
                  ],
                ),
              );
            }

            return const CircularProgressIndicator(
              color: Colors.teal,
            );
          },
        ),
      ),
    );
  }
}
