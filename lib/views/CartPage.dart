import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_ordering_app/models/Cartmodel.dart';
import 'package:food_ordering_app/widgets/msgToast.dart';
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


class _CartList extends StatefulWidget {
  @override
  __CartListState createState() => __CartListState();
}

class __CartListState extends State<_CartList> {

  final CartModel _cart = CartModel();



  @override
  Widget build(BuildContext context) {
  //  VxState.watch(context, on:[RemoveMutation]);


    return (_cart.cart==null)? "Nothing to show".text.xl3.make().centered(): ListView.builder(
      itemCount: _cart.cart.cartItem.length,
      itemBuilder: (context,index)  => ListTile(
        leading: IconButton(
          icon: Icon(Icons.remove_circle_outline),
          onPressed: (){
            _cart.cart.decrementItemFromCart(index);
            msgToast('${_cart.cart.cartItem[index].productDetails.dish_name} removed from the cart');
            setState(() {
              _CartTotal();
            });
          },
        ),
        trailing: '${_cart.cart.cartItem[index].quantity} * \₹${_cart.cart.cartItem[index].unitPrice}'.text.lg.color(Color(0xff403b58)).make(),
        title: '${_cart.cart.cartItem[index].productDetails.dish_name}'.text.color(Color(0xff403b58)).make(),
      ),
    );
  }
}




class _CartTotal extends StatefulWidget {
  @override
  __CartTotalState createState() => __CartTotalState();
}

class __CartTotalState extends State<_CartTotal> {

  final CartModel _cart = CartModel();

  var totalprice=0.0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      totalprice = _cart.cart.getTotalAmount();
    });
  }


  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          "\₹${totalprice}".text.xl5.color(Color(0xff403b58)).make(),
          30.widthBox,
          ElevatedButton(
            onPressed: (){
              Scaffold.of(context).showSnackBar(SnackBar(content: "Buying not supported yet".text.make()));
            },
            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color(0xff403b58))),
            child: "Buy".text.white.make(),
          ).w32(context),
        ],
      ),
    );
  }
}