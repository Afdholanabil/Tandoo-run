// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));



class LoginModel {
    Data? data;
    String? message;
    bool status;

    LoginModel({
         this.data,
         this.message,
        required this.status,
    });

    factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        data: Data.fromJson(json["data"]),
        message: json["message"],
        status: json["status"],
    );


}

class Data {
    int? id;
    String? nama;
    String? noTelfon;

    Data({
         this.id,
         this.nama,
         this.noTelfon,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        nama: json["nama"],
        noTelfon: json["no_telfon"],
    );


}
