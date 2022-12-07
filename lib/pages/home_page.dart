import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vot/models/product.dart';
import 'package:vot/widgets/bottom_bar.dart';
import 'package:vot/widgets/catalog.dart';
import 'package:vot/widgets/item_card.dart';


class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final productData = Provider.of<ProductDataProvider>(context);

    return Scaffold(
      backgroundColor: Colors.red,
      body:  SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height - 50,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(35),
              bottomRight: Radius.circular(35),
            )
            ),
          child: ListView(
            padding: const EdgeInsets.all(10.0),
            children: <Widget>[
              const ListTile(
                title: Text('Освежающие напитки',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                subtitle: Text('Больше чем 100 видов напитков',
                style: TextStyle(fontSize: 16),
                ),
                trailing: Icon(Icons.panorama_horizontal),
              ),

              Container(
                padding: const EdgeInsets.all(5.0),
                height: 290,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: productData.items.length,
                  itemBuilder: (context, int index) =>
                    ChangeNotifierProvider.value(value: productData.items[index],
                    child: ItemCard(),
                    ),
                  ),
              ),

              const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text('Каталог коктейлей',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),

            ...productData.items.map((value){
              return CatalogListTile(img: value.img);
            }).toList(),

            Container(
              child: const Text('Список каталогов'),
            ),
            ],
          ),
          ),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}