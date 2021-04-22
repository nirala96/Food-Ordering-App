import 'package:flutter/material.dart';
import 'package:food_ordering_app/models/catalogmodel.dart';
import 'package:velocity_x/velocity_x.dart';

import 'CatalogImage.dart';

class CatalogItemUser extends StatelessWidget {
  final CatalogModel catalog;

  const CatalogItemUser({Key key, @required this.catalog})
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
                AddToCart(catalog: catalog),
              ],
            ).pOnly(right: 8.0)
          ],
        ))
      ],
    )).color(Colors.white).roundedLg.square(150).make().py16();
  }
}

class AddToCart extends StatelessWidget {
  final CatalogModel catalog;
  AddToCart({
    Key key,
    this.catalog,
  }) : super(key: key);

  //bool isInCart = false;
  // final _cart = CartModel();

  @override
  Widget build(BuildContext context) {
    // VxState.watch(context, on: [AddMutation, RemoveMutation]);

    // final CartModel _cart = (VxState.store as MyStore).cart;
    //  final CatalogModel _catalog = (VxState.store as MyStore).catalog;

    //bool isInCart = _cart.items.contains(catalog)?? false;

    return ElevatedButton(
      onPressed: () {},
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          Vx.indigo500,
        ),
        shape: MaterialStateProperty.all(
          StadiumBorder(),
        ),
      ),
      child: "Add to Cart".text.make(),
    );
  }
}
