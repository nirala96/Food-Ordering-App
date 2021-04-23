class User {
  final String user_id;
  final String user_name;
  final String user_pass;
  final int isAdmin;

  User(this.user_id, this.user_name, this.user_pass, this.isAdmin); 
  factory User.fromMap(Map<String, dynamic> json) {
    return User(
        json['user_id'], json['user_name'], json['user_pass'], json['isAdmin']);
  }
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        json['user_id'], json['user_name'], json['user_pass'], json['isAdmin']);
  }

  Map<String, dynamic> toJson() => {
        'user_id': user_id,
        'user_name': user_name,
        'user_pass': user_pass,
        'isAdmin': isAdmin
      };
}
