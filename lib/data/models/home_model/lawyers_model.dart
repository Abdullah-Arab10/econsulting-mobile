class LawyersModel
{
  late String first_name;
  late String last_name;
  late String email;
  late int role;
  late String address;
  late String image;
  late int phone;
  late String user_id;
  late int id;
  late String bio;
  late int rating;
  late int skill;
  late String shiftStart;
  late String shiftEnd;

  LawyersModel.fromJson(Map<String, dynamic> json)
  {
    first_name = json['first_name'];
    last_name = json['last_name'];
    email = json['email'];
    role = json['role'];
    address = json['address'];
    image = json['image'];
    phone = json['phone'];
    user_id = json['user_id'];
    id = json['id'];
    bio = json['bio'];
    rating = json['rating'];
    skill = json['skill'];
    shiftStart = json['shiftStart'];
    shiftEnd = json ['shiftEnd'];
  }
}