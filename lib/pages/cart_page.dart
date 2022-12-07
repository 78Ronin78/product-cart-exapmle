import 'package:flutter/material.dart';
import 'package:vot/models/cart.dart';
import 'package:vot/widgets/cart_list_item.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartData = Provider.of<CartDataProvider>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text('Корзинка с частью'),
        ),
        body: cartData.cartItems.isEmpty
            ? Card(
                elevation: 5.0,
                margin: const EdgeInsets.all(30.0),
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Text(
                    'Корзина пуста',
                  ),
                ),
              )
            : Column(
                children: <Widget>[
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        'Стоимость ' + cartData.totalAmount.toStringAsFixed(2),
                        style: TextStyle(fontSize: 20.0),
                      ),
                      MaterialButton(
                        onPressed: () {
                          cartData.clear();
                        },
                        color: Theme.of(context).primaryColor,
                        child: Text('Приобрести'),
                      ),
                    ],
                  ),
                  Divider(),
                  Expanded(child: CartItemList(cartData: cartData)),
                ],
              ));
  }
}
