
class UserData
{
  late int id;
  late String first_name;
  late String last_name;
  late String email;
  late int role;
  late String address;
  late String phone;
  late String image;
  late String updated_at;
  late String created_at;

  UserData.fromJson(Map<String,dynamic> json)
  {
    id = json['id'];
    first_name = json['name'];
    last_name = json['name'];
    email = json['email'];
    role = json['role'];
    address = json['address'];
    phone = json['phone'];
    image = json['image'];
    updated_at = json['updated_at'];
    created_at = json['created_at'];
  }
}