class UserDetails {
  final String user_id;
  final String user_email;
  final String user_addr;
  final String user_phno;
  final int pincode;
  final String join_dt;
  final String user_name;
  final String user_pass;
  final int isAdmin;

  UserDetails(this.user_id, this.user_email, this.user_phno, this.pincode,
      this.join_dt, this.user_name, this.user_pass, this.isAdmin, this.user_addr);
  factory UserDetails.fromMap(Map<String, dynamic> json) {
    return UserDetails(
      json['user_id'],
      json['user_email'],
      json['user_phno'],
      json['pincode'],
      json['join_dt'],
      json['user_name'],
      json['user_pass'],
      json['isAdmin'],
      json['user_addr'],
    );
  }
  factory UserDetails.fromJson(Map<String, dynamic> json) {
    return UserDetails(
      json['user_id'],
      json['user_email'],
      json['user_phno'],
      json['pincode'],
      json['join_dt'],
      json['user_name'],
      json['user_pass'],
      json['isAdmin'],
      json['user_addr'],
    );
  }
}
