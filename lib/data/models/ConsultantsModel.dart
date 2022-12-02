class ConsultantsModel {
  late int id;
  late String first_name;
  late String last_name;
  late String email;
  late int role;
  late String address;
  late int phone;
  late String image;
  ConsultantsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    first_name = json['first_name'];
    last_name = json['last_name'];
    email = json['email'];
    role = json['role'];
    address = json['address'];
    phone = json['phone'];
    image = json['image'];
  }
}
