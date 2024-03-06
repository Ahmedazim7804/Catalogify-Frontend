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
      color: Colors.transparent,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.black, width: 1.0),
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 5,
      child: Padding(
        padding:
            const EdgeInsets.only(top: 20, bottom: 20, left: 10, right: 10),
        child: ListTile(
          leading: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 0.3,
              ),
            ),
            child: Image.network(
                "https://th.bing.com/th/id/OIP.SGe24T2pZb0yX3NYSWydDQHaJg?rs=1&pid=ImgDetMain"),
          ),
          title: Column(
            children: [
              Text(
                'this is title',
                style: kLargeTextStyle,
              ),
              Text('Price', style: kNormalTextStyle,),
              Row(
                children: [

                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
