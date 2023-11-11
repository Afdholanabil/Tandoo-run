// To parse this JSON data, do
//
//     final akunModel = akunModelFromJson(jsonString);

import 'dart:convert';

AkunModel akunModelFromJson(String str) => AkunModel.fromJson(json.decode(str));


class AkunModel {
    int? id;
    String? nama;
    String? noTelfon;
    String? password;

    AkunModel({
         this.id,
         this.nama,
         this.noTelfon,
         this.password,
    });

    factory AkunModel.fromJson(Map<String, dynamic> json) => AkunModel(
        id: json["id"],
        nama: json["nama"],
        noTelfon: json["no_telfon"],
        password: json["password"],
    );

}
