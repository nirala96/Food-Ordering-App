import 'package:flutter/material.dart';
import 'package:food_ordering_app/models/Ordersmodel.dart';


class OrderServices{
  static List<OrdersModel> getOrderList() {
    return [
      new OrdersModel(
        id : 1,
        title: "Mix veg Pizza",
        price: 209,
        image: "https://static.toiimg.com/thumb/53110049.cms?width=1200&height=900",
        quantity: 2,
      ),
      new OrdersModel(
        id : 1,
        title: "Mix veg Pizza",
        price: 209,
        image: "https://static.toiimg.com/thumb/53110049.cms?width=1200&height=900",
        quantity: 3,
      ),
      new OrdersModel(
        id : 1,
        title: "Mix veg Pizza",
        price: 209,
        image: "https://static.toiimg.com/thumb/53110049.cms?width=1200&height=900",
        quantity: 2,
      ),
      new OrdersModel(
        id : 1,
        title: "Mix veg Pizza",
        price: 209,
        image: "https://static.toiimg.com/thumb/53110049.cms?width=1200&height=900",
        quantity: 1,
      ),
      new OrdersModel(
        id : 1,
        title: "Mix veg Pizza",
        price: 209,
        image: "https://static.toiimg.com/thumb/53110049.cms?width=1200&height=900",
        quantity: 2,
      ),
      new OrdersModel(
        id : 1,
        title: "Mix veg Pizza",
        price: 209,
        image: "https://static.toiimg.com/thumb/53110049.cms?width=1200&height=900",
        quantity: 4,
      ),
      new OrdersModel(
        id : 1,
        title: "Mix veg Pizza",
        price: 209,
        image: "https://static.toiimg.com/thumb/53110049.cms?width=1200&height=900",
        quantity: 1,
      ),
      new OrdersModel(
        id : 1,
        title: "Mix veg Pizza",
        price: 209,
        image: "https://static.toiimg.com/thumb/53110049.cms?width=1200&height=900",
        quantity: 2,
      ),
    ];
  }
}