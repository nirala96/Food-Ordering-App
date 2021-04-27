import 'package:flutter_cart/flutter_cart.dart';

class CartModel {

  var message;

  /// Creating the instance of flutter cart package.
  var cart = FlutterCart();

  /// sample function
  addToCart(dynamic _product) =>
      {
        print('addtocart called'),
        message = cart.addToCart(
            productId: _product.dish_id,
            unitPrice: _product.dish_price,
            quantity: 1,

            ///[uniqueCheck] is used to differentiate the type between item
            ///[e.g] the shirt sizes in (LARGE, MEDIUM, SMALL) the [Product ID] will remain same
            ///But if UUID is not present so, how we can differentiate between them? So in this case we will
            ///User the uniqueCheck
           // uniqueCheck: _product.selectedProductType,

            ///[productDetailsObject] is used as a dump variable you can dump your object and any kind of data
            ///that you wanted use in future.
            productDetailsObject: _product
          ),

      };

  /// This function is used to decrement the item quantity from cart
  removeItemFromCart(int index) =>
      {
        cart.decrementItemFromCart(index),
      };

  /// This function is used to increment the item quantity into cart
  addItemToCart(int index) {
    cart.incrementItemToCart(index);
  }
}


  // // static final cartModel = CartModel._internal();
  // //
  // // CartModel._internal();
  // // factory CartModel() => cartModel;
  //
  //
  // //dishlist field
  // DishList _dishlist;
  //
  // //collection of ids
  // final List<int> _itemIds = [];
  //
  // //get dishlist
  // DishList get dishlist => _dishlist;
  //
  //
  // set dishlist(DishList newDishlist)
  // {
  //   _dishlist = newDishlist;
  // }
  //
  // //get items in the cart
  // List<Dish> get dishes => _itemIds.map((id) => _dishlist.getById(id)).toList();
  //
  // //get total price
  // num get totalPrice => dishes.fold(0, (total, current) => total+current.dish_price);

//add item
// void add(Dish dish){
//   _itemIds.add(int.parse(dish.dish_id));
// }
//
// //remove item
// void remove(Dish dish){
//   _itemIds.remove(dish.dish_id);
// }


// class AddMutation extends VxMutation<MyStore>
// {
//
//   final Dish dish;
//
//   AddMutation(this.dish);
//  // @override
//   perform() {
//     CartModel()._itemIds.add(int.parse(dish.dish_id));
//     print('${dish.dish_name} added in the cart');
//     msgToast('${dish.dish_name} added in the cart');
//   }
//
// }
//
//
//
//
//
//
// class RemoveMutation// extends VxMutation<MyStore>
// {
//
//   final Dish dish;
//
//   RemoveMutation(this.dish);
//   //@override
//   perform() {
//     CartModel()._itemIds.remove(dish.dish_id);
//   }
// }
