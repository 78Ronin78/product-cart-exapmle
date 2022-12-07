import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vot/models/cart.dart';
import 'package:vot/pages/item_page.dart';

class CartItem extends StatelessWidget {
  final cartData;
  final index;

  CartItem({Key? key, this.cartData, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        leading: InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ItemPage(
                  productId: cartData.cart_Items.keys.toList()[index],
                ),
              ),
            );
          },
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image:
                    Image.asset(cartData.cartItems.values.toList()[index].img)
                        .image,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        title: Text(cartData.cartItems.values.toList()[index].title),
        subtitle:
            Text('Цена: ${cartData.cartItems.values.toList()[index].price}'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            IconButton(
                icon: Icon(Icons.remove_circle_outline),
                onPressed: () {
                  Provider.of<CartDataProvider>(context, listen: false)
                      .updateItemsSubOne(
                          cartData.cartItems.keys.toList()[index]);
                }),
            Text('${cartData.cartItems.values.toList()[index].number}'),
            IconButton(
                icon: Icon(Icons.add_circle_outline),
                onPressed: () {
                  Provider.of<CartDataProvider>(context, listen: false)
                      .updateItemsAddOne(
                          cartData.cartItems.keys.toList()[index]);
                }),
          ],
        ),
      ),
    );
  }
}
