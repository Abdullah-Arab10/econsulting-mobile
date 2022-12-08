import 'package:flutter/material.dart';

class UserModel {
  late String first_name;
  late String last_name;
  late String email;
  late int role;
  late String address;
  late String image;
  late String updated_at;
  late String created_at;
  late int id;

  UserModel.fromJson(Map<String, dynamic> json) {

    first_name = json['first_name'];
    last_name = json['last_name'];
    email = json['email'];
    role = json['role'];
    address = json['address'];
    image = json['image'];
    updated_at = json['updated_at'];
    created_at = json['created_at'];
    id = json['id'];
  }
}
