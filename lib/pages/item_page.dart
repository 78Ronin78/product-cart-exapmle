import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:vot/models/cart.dart';
import 'package:vot/models/product.dart';
import 'package:vot/pages/cart_page.dart';

class ItemPage extends StatelessWidget {
  final String productId;

  ItemPage({Key? key, required this.productId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final data =
    //     Provider.of<ProductDataProvider>(context).getElementById(productId);
    final data = context.watch<ProductDataProvider>().getElementById(productId);

    return Scaffold(
        appBar: AppBar(
          title: Text(
            data.title,
            style: TextStyle(fontStyle: FontStyle.normal),
          ),
        ),
        body: Container(
          child: ListView(
            children: <Widget>[
              Hero(
                tag: data.img,
                child: Container(
                  height: 300,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: Image.asset(data.img).image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Card(
                elevation: 5.0,
                margin: const EdgeInsets.symmetric(
                    horizontal: 35.0, vertical: 10.0),
                child: Container(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        data.title,
                        style: TextStyle(fontSize: 26.0),
                      ),
                      Divider(),
                      Row(
                        children: <Widget>[
                          Text(
                            'Цена: ',
                            style: TextStyle(fontSize: 20.0),
                          ),
                          Text(
                            '${data.price}',
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ],
                      ),
                      Divider(),
                      Text(data.description),
                      SizedBox(
                        height: 20.0,
                      ),
                      //Provider.of<CartDataProcider>(context)
                      // .cartItems
                      // .containsKey(productId)
                      context
                              .watch<CartDataProvider>()
                              .cartItems
                              .containsKey(productId)
                          ? Column(children: <Widget>[
                              MaterialButton(
                                  color: Color(0xFFCCFF90),
                                  child: Text('Перейти в корзину'),
                                  onPressed: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) => CartPage(),
                                    ));
                                  }),
                              Text(
                                'Товар Уже добавлен в корзину',
                                style: TextStyle(
                                    fontSize: 12.0, color: Colors.blueGrey),
                              )
                            ])
                          : MaterialButton(
                              color: Theme.of(context).primaryColor,
                              child: Text('Добавить в корзину'),
                              onPressed: () {
                                context.read<CartDataProvider>().addItem(
                                      productId: data.id,
                                      img: data.img,
                                      title: data.title,
                                      price: data.price,
                                    );
                                // Provider.of(context, listen: false).addItem(
                                //   productId: data.id,
                                //   img: data.img,
                                //   title: data.title,
                                //   price: data.price,
                                // );
                              },
                            ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
