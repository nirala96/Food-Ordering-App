class Dish {
  final int dish_id;
  final String dish_name;
  final int dish_price;
  final int isAvailable;
  final String dish_type;
  final String dish_rest_id;

  Dish(
    this.dish_id,
    this.dish_name,
    this.dish_price,
    this.isAvailable,
    this.dish_type,
    this.dish_rest_id,
  );
  factory Dish.fromMap(Map<String, dynamic> json) {
    return Dish(
      json['dish_id'],
      json['dish_name'],
      json['dish_price'],
      json['isAvailable'],
      json['dish_type'],
      json['dish_rest_id'],
    );
  }
  factory Dish.fromJson(Map<String, dynamic> json) {
    return Dish(
      json['dish_id'],
      json['dish_name'],
      json['dish_price'],
      json['isAvailable'],
      json['dish_type'],
      json['dish_rest_id'],
    );
  }
}
