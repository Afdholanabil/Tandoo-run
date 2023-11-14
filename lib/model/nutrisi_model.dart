// To parse this JSON data, do
//
//     final nutrisiModel = nutrisiModelFromJson(jsonString);

import 'dart:convert';

NutrisiModel nutrisiModelFromJson(String str) => NutrisiModel.fromJson(json.decode(str));


class NutrisiModel {
    String? hariTanggal;
    int? id;
    String? jam;
    String? ph;
    int? ppm;
    int? volumeAir;
    int? waktuId;

    NutrisiModel({
         this.hariTanggal,
         this.id,
         this.jam,
         this.ph,
         this.ppm,
         this.volumeAir,
         this.waktuId,
    });

    factory NutrisiModel.fromJson(Map<String, dynamic> json) => NutrisiModel(
        hariTanggal: json["hari_tanggal"],
        id: json["id"],
        jam: json["jam"],
        ph: json["ph"],
        ppm: json["ppm"],
        volumeAir: json["volume_air"],
        waktuId: json["waktu_id"],
    );

   
}
