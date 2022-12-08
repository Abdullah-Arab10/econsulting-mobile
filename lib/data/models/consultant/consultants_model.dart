import 'package:flutter/material.dart';

class ConsultantsModel {
  late String first_name;
  late String last_name;
  late String email;
  late int role;
  late String address;
  late String image;
  late int phone;
  late String updated_at;
  late String created_at;
  late int id;
  late String bio;
  late int skill;
  late String shiftStart;
  late String shiftEnd;

  ConsultantsModel.fromJson(Map<String, dynamic> json) {

    first_name = json['first_name'];
    last_name = json['last_name'];
    email = json['email'];
    role = json['role'];
    address = json['address'];
    image = json['image'];
    phone = json['phone'];
    updated_at = json['updated_at'];
    created_at = json['created_at'];
    id = json['id'];
    bio = json['bio'];
    skill = json['skill'];
    shiftStart = json['shiftStart'];
    shiftEnd = json ['shiftEnd'];
  }
}
