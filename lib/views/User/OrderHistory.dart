import 'package:flutter/material.dart';
import 'package:food_ordering_app/services/OrderServices.dart';
import 'package:get_it/get_it.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:food_ordering_app/models/Ordersmodel.dart';

class OrderHistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff5f5f5),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Your Orders".text.make(),
      ),
      body: Column(
        children: [
          OrdersList().p32().expand(),
        ],
      ),
      //bottomNavigationBar: CartTotal(),
    );
  }
}



class OrdersList extends StatefulWidget {
  @override
  _OrdersListState createState() => _OrdersListState();
}

class _OrdersListState extends State<OrdersList> {

  OrderServices get service => GetIt.I<OrderServices>();

  List<OrdersModel> items = [];

  @override
  void initState() {
    items = OrderServices.getOrderList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: items.length,
        itemBuilder: (context, index) {
          final order = items[index];
          return InkWell(
            child: OrdersItem(order: order),
          );
        });
  }
}



class OrdersItem extends StatelessWidget {
  final OrdersModel order;

  const OrdersItem({Key key, @required this.order})
      : assert(order != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Hero(
            tag: Key(order.id.toString()),
            child: Image.network(
              order.image,
            ).box.rounded.p8.color(Color(0xfff5f5f5)).make().p16().w40(context),
          ),
          Expanded(
            child : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                order.title.text.lg.color(Color(0xff403b58)).bold.make(),
                5.heightBox,
                "${order.quantity} \× \₹${order.price}".text.color(Color(0xff403b58)).lg.make(),
                5.heightBox,
                // ButtonBar(
                //   alignment: MainAxisAlignment.spaceBetween,
                //   buttonPadding: EdgeInsets.zero,
                //   children: [
                //     RemoveButton(),
                //   ],
                // ).pOnly(right: 16.0)
              ],
            ),
          ),
        ],
      ),
    );
  }
}


// class RemoveButton extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//
//     return ElevatedButton(
//       onPressed: (){
//
//       },
//       style: ButtonStyle(
//         backgroundColor: MaterialStateProperty.all(
//           Vx.indigo500,
//         ),
//         shape: MaterialStateProperty.all(
//           StadiumBorder(),
//         ),
//       ),
//       child: "Remove".text.make(),
//     );
//   }
// }



// class CartTotal extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//
//     return SizedBox(
//       height: 100,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           "\₹1490".text.xl5.color(Color(0xff403b58)).make(),
//           ElevatedButton(
//             onPressed: (){
//               Scaffold.of(context).showSnackBar(SnackBar(content: "Buying not supported".text.make()));
//             },
//             style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color(0xff403b58))),
//             child: "Buy".text.white.make(),
//           ).w32(context),
//         ],
//       ),
//     );
//   }
// }