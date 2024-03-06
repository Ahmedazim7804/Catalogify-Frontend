import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inno_hack/screens/widgets/heading_text.dart';
import 'package:inno_hack/utilities/constants.dart';

class ProductItem extends StatefulWidget {
  final int index;

  const ProductItem({Key? key, required this.index}) : super(key: key);

  @override
  State<ProductItem> createState() => _ProductItemState(index: index);
}

class _ProductItemState extends State<ProductItem> {
  final int index;
  bool _expanded = false;

  _ProductItemState({required this.index});

  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: Colors.transparent,
      shadowColor: Colors.transparent,
      color: Colors.teal.shade50,
      elevation: 5,
      child: ExpansionTile(
        shape: const ContinuousRectangleBorder(
            side: BorderSide(width: 0, color: Colors.transparent)),
        tilePadding: const EdgeInsets.symmetric(vertical: 1, horizontal: 0),
        leading: const CircleAvatar(
          radius: 40,
          backgroundImage: NetworkImage(
              "https://img.freepik.com/free-psd/isolated-black-t-shirt-front_125540-1167.jpg?w=1060&t=st=1709720975~exp=1709721575~hmac=1693787fa17485df9d7da729102d8da3028b62bee09d9c6ececfe8bc8cf15060"),
        ),
        title: Text(
          "Title",
          style: GoogleFonts.inter(fontSize: 25, fontWeight: FontWeight.w700),
        ),
        subtitle: Text(
          "Description",
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w300,
            fontSize: 15,
          ),
        ),
        onExpansionChanged: (expanded) {
          setState(() {
            _expanded = expanded;
          });
        },
        initiallyExpanded: _expanded,
        children: const [
          Align(
            alignment: Alignment.centerLeft,
            child: HeadingText(text: "Description"),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an "),
          ),
          SizedBox(
            height: 20,
          )
          // Padding(
          //     padding: const EdgeInsets.symmetric(horizontal: 15),
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceAround,
          //       children: [
          //         const SizedBox(
          //           width: 250,
          //           child: Text(
          //               "Full Description dsfjsdlkfjdflksjfsl fdslfjdslfk fsldjfld"),
          //         ),
          //         const Spacer(),
          //         Icon(
          //           Icons.edit,
          //           color: Colors.teal.shade900,
          //         ),
          //         Icon(
          //           Icons.delete,
          //           color: Colors.teal.shade900,
          //         )
          //       ],
          //     )),
        ],
      ),
    );
  }
}
