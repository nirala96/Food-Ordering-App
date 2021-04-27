import 'package:flutter/material.dart';
import 'package:food_ordering_app/models/Cart.dart';
import 'package:food_ordering_app/models/Dish.dart';
import 'package:food_ordering_app/widgets/msgToast.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../widgets/CatalogImage.dart';

class CatalogItemUser extends StatelessWidget {

  final Dish dish;

  const CatalogItemUser({Key key, @required this.dish})
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
            image:
                "https://static.toiimg.com/thumb/53110049.cms?width=1200&height=900",
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
                "\₹${dish.dish_price}".text.xl.bold.make(),
                AddToCart(dish : dish),
              ],
            ).pOnly(right: 16.0)
          ],
        ))
      ],
    )).color(Colors.white).roundedLg.square(140).make().py8();
  }
}




class AddToCart extends StatelessWidget {

  final Dish dish;
  AddToCart( {
    Key key, this.dish,
  }) : super(key: key);

  final CartModel _cart = CartModel();

  @override
  Widget build(BuildContext context) {

    return ElevatedButton(
      onPressed: (){
        if(_cart.cart.findItemIndexFromCart(dish.dish_id)==null) {
          CartModel().addToCart(dish);
          msgToast('${dish.dish_name} added in the cart');
        }
        else {
            CartModel().addItemToCart(_cart.cart.findItemIndexFromCart(dish.dish_id));
            msgToast('${dish.dish_name} added in the cart');
        }
      },

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
