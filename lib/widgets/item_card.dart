import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vot/models/cart.dart';
import 'package:vot/models/product.dart';
import 'package:vot/pages/item_page.dart';

class ItemCard extends StatelessWidget {
  ItemCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);

    return Container(
      width: 150,
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Color(int.parse(product.color)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => ItemPage(productId: product.id)),
              );
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  height: 160,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: Image.asset('assets/images/VKS-011.png').image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                    child: Text(
                  '${product.title}',
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                )),
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('${product.price}'),
                IconButton(
                  icon: const Icon(
                    Icons.add_circle_outline,
                    color: Colors.black12,
                  ),
                  onPressed: () {
                    Provider.of<CartDataProvider>(context, listen: false)
                        .addItem(
                      productId: product.id,
                      price: product.price,
                      title: product.title,
                      img: product.img,
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
