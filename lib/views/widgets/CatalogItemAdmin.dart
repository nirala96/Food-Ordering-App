import 'package:flutter/material.dart';
import 'package:food_ordering_app/models/catalogmodel.dart';
import 'package:velocity_x/velocity_x.dart';

import 'CatalogImage.dart';

class CatalogItemAdmin extends StatelessWidget {
  final CatalogModel catalog;

  const CatalogItemAdmin({Key key, @required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        Hero(
          tag: Key(catalog.id.toString()),
          child: CatalogImage(
            image: catalog.image,
          ),
        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            catalog.title.text.lg.color(Color(0xff403b58)).bold.make(),
            catalog.type.text
                .textStyle(context.captionStyle)
                .color(Color(0xff403b58))
                .make(),
            10.heightBox,
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding: EdgeInsets.zero,
              children: [
                "\$${catalog.price}".text.xl.bold.make(),
                EditButton(),
              ],
            ).pOnly(right: 16.0)
          ],
        ))
      ],
    )).color(Colors.white60).roundedLg.square(140).make().py8();
  }
}



class EditButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {


    return ElevatedButton(
      onPressed: (){

      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          Vx.indigo500,
        ),
        shape: MaterialStateProperty.all(
          StadiumBorder(),
        ),
      ),
      child: Icon(Icons.edit),
    );
  }
}