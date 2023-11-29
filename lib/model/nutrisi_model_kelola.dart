// To parse this JSON data, do
//
//     final nutrisiModel = nutrisiModelFromJson(jsonString);

import 'dart:convert';

NutrisiModelKelola nutrisiModelKelolaFromJson(String str) => NutrisiModelKelola.fromJson(json.decode(str));


class NutrisiModelKelola {
    String? hariTanggal;
    int? id;
    String? jam;
    String? ph;
    int? ppm;
    int? volumeAir;
    int? waktuId;

    NutrisiModelKelola({
         this.hariTanggal,
         this.id,
         this.jam,
         this.ph,
         this.ppm,
         this.volumeAir,
         this.waktuId,
    });

    factory NutrisiModelKelola.fromJson(Map<String, dynamic> json) => NutrisiModelKelola(
        hariTanggal: json["hari_tanggal"],
        id: json["id"],
        jam: json["jam"],
        ph: json["ph"],
        ppm: json["ppm"],
        volumeAir: json["volume_air"],
        waktuId: json["waktu_id"],
    );

   
}
