import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_ordering_app/models/Cartmodel.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff5f5f5),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.make(),
      ),

      body: Column(
        children: [
          _CartList().p32().expand(),
          Divider(),
          _CartTotal(),
        ],
      ),
    );
  }
}


class _CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CartModel _cart = CartModel();
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          VxConsumer(       //can also use VxBuilder
            builder: (context, _){
             return "\$${_cart.totalPrice}".text.xl5.color(context.theme.accentColor).make();
           },
           mutations: {RemoveMutation},
           notifications: {},
         ),
          30.widthBox,
          ElevatedButton(
            onPressed: (){
              Scaffold.of(context).showSnackBar(SnackBar(content: "Buying not supported yet".text.make()));
            },
            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(context.theme.buttonColor)),
            child: "Buy".text.white.make(),
          ).w32(context),
        ],
      ),
    );
  }
}


class _CartList extends StatelessWidget {
  // final _cart = CartModel();

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on:[RemoveMutation]);

    final CartModel _cart = (VxState.store as MyStore).cart;

    return _cart.items.isEmpty? "Nothing to show".text.xl3.make().centered(): ListView.builder(
      itemCount: _cart.items?.length,
      itemBuilder: (context,index)  => ListTile(
        leading: Icon(Icons.done),
        trailing: IconButton(
          icon: Icon(Icons.remove_circle_outline),
          onPressed: (){
            RemoveMutation(_cart.items[index]);
            // _cart.remove(_cart.items[index]);
            // setState(() {});
          },
        ),
        title: _cart.items[index].name.text.color(context.theme.accentColor).make(),
      ),
    );
  }
}