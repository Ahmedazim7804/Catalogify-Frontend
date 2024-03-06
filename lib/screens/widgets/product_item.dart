import 'package:flutter/material.dart';

import 'package:inno_hack/utilities/constants.dart';

class ProductItem extends StatefulWidget {
  final int index;

  const ProductItem({Key? key, required this.index}) : super(key: key);

  @override
  State<ProductItem> createState() => _ProductItemState(index: index);
}

class _ProductItemState extends State<ProductItem> {
  final int index;


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
        padding: const EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
        child: ListTile(
          leading: Container(
            height: 60,
            width: 60,
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
              Center(
                child: Text(
                  'Cotton Black TShirt For Men',
                  style: kLargeTextStyle,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Price',
                style: kNormalTextStyle,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
                  IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
                  SizedBox(
                    width: 60,
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
