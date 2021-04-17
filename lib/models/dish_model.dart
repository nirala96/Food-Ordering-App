class User {
  final int dish_id;
  final String dish_name;
  final String dish_price;
  final bool isAvailable;

  User(this.dish_id, this.dish_name, this.dish_price, this.isAvailable);
  factory User.fromMap(Map<String, dynamic> json) {
    return User(
        json['dish_id'], json['dish_name'], json['dish_price'], json['isAvailable']);
  }
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        json['dish_id'], json['dish_name'], json['dish_price'], json['isAvailable']);
  }
}