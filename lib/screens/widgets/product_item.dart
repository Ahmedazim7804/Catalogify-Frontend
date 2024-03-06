import 'package:flutter/material.dart';
import 'package:inno_hack/core/constants.dart';
import 'package:inno_hack/screens/widgets/SingleProduct.dart';

import 'package:inno_hack/utilities/constants.dart';

class ProductItem extends StatefulWidget {
  final int index;

  const ProductItem({Key? key, required this.index}) : super(key: key);

  @override
  State<ProductItem> createState() => _ProductItemState(index: index);
}

class _ProductItemState extends State<ProductItem> {
  final int index;

  void _showsingleproduct() {
    showModalBottomSheet(
        useSafeArea: true,
        context: context,
        isScrollControlled: true,
        builder: (context) => SingleProduct(
            title: 'title',
            price: 20,
            category: Categories.books,
            description: "description is this khushal bhasin",
            brand: "brand",
            warranty: 20,
            returnPeriod: 20,
            state: "state",
            userId: "userId",
            images: const []));
  }

  _ProductItemState({required this.index});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      background: Container(
          margin: const EdgeInsets.symmetric(vertical: 5),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          alignment: Alignment.centerRight,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.red,
          ),
          child: const Row(
            children: [
              Icon(
                Icons.delete,
                color: Colors.white,
              ),
              Spacer(),
              Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ],
          )),
      child: GestureDetector(
        onTap: () {
          _showsingleproduct();
        },
        child: Card(
          color: Colors.teal.shade50,
          margin: const EdgeInsets.symmetric(
            vertical: 5,
          ),
          // surfaceTintColor: Colors.transparent,
          // shadowColor: Colors.transparent,
          // color: Colors.transparent,
          shape: RoundedRectangleBorder(
            // side: const BorderSide(color: Colors.black, width: 1.0),
            borderRadius: BorderRadius.circular(5),
          ),
          elevation: 1,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              children: [
                ListTile(
                  leading: Image.network(
                      "https://th.bing.com/th/id/OIP.SGe24T2pZb0yX3NYSWydDQHaJg?rs=1&pid=ImgDetMain"),
                  title: Text(
                    'Cotton Black TShirt For Men',
                    overflow: TextOverflow.ellipsis,
                    style: kLargeTextStyle,
                  ),
                  subtitle: const Text(
                    "\$200",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.edit),
                    style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        backgroundColor: Colors.teal),
                  ),
                  dense: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
