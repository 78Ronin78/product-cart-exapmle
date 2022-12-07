import 'package:flutter/material.dart';

class CatalogListTile extends StatelessWidget {
  final img;
  CatalogListTile({Key? key, this.img}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //!Навигация на страницу каталога
      },
      child: Container(
        padding: const EdgeInsets.all(10.0),
        child: ListTile(
          leading: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: Image.asset(img).image,
                fit: BoxFit.cover
                ),
                ),
            ),
    
            title: Text('Военный набор'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('09:00 - 00:00'),
            Row(
              children: <Widget>[
                Icon(Icons.backpack,size: 15, color: Colors.amberAccent), //!Рюкзак иконка, тапающий список
                Text('4,9'),            ],
            ),
            ],
            ),
          ),
        ),
    );
  }
  }
