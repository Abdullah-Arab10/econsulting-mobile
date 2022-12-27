class ConsultantData
{
  late int id;
  late String firstName;
  late String lastName;
  late String email;
  late int role;
  late String address;
  late String phone;
  late String image;
  late String bio;
  late int skill;
  late String shiftStart;
  late String shiftEnd;

  ConsultantData.fromJson(dynamic json)
  {
json=json[0];
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    role = json['role'];
    address = json['address'];
    phone = json['phone'];
    image = json['image'];
    bio = json['bio'];
    skill = json['skill'];
    shiftStart = json['shiftStart'];
    shiftEnd = json['shiftEnd'];
  }
}