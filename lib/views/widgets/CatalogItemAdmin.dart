import 'package:flutter/material.dart';
import 'package:food_ordering_app/models/Dish.dart';
import 'package:velocity_x/velocity_x.dart';

import 'CatalogImage.dart';

class CatalogItemAdmin extends StatelessWidget {
  final Dish dish;

  const CatalogItemAdmin({Key key, @required this.dish})
      : assert(dish != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        Hero(
          tag: Key(dish.dish_id.toString()),
          child: CatalogImage(
            image: "https://static.toiimg.com/thumb/53110049.cms?width=1200&height=900",
          ),
        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            dish.dish_name.text.lg.color(Color(0xff403b58)).bold.make(),
            dish.dish_type.text
                .textStyle(context.captionStyle)
                .color(Color(0xff403b58))
                .make(),
            10.heightBox,
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding: EdgeInsets.zero,
              children: [
                "\$${dish.dish_price}".text.xl.bold.make(),
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
      onPressed: () {},
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
