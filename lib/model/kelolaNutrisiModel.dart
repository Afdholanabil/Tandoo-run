// To parse this JSON data, do
//
//     final kelolaNutrisiModel = kelolaNutrisiModelFromJson(jsonString);

import 'dart:convert';

KelolaNutrisiModel kelolaNutrisiModelFromJson(String str) => KelolaNutrisiModel.fromJson(json.decode(str));



class KelolaNutrisiModel {
    bool status;
    int? akunId;
    int? idKontrolNutrisi;
    int? infoNutrisiId;
    int? nilaiPpmInput;
    int? nilaiPpmSensor;

    KelolaNutrisiModel({
        required this.status,
         this.akunId,
         this.idKontrolNutrisi,
         this.infoNutrisiId,
         this.nilaiPpmInput,
         this.nilaiPpmSensor,
    });

    factory KelolaNutrisiModel.fromJson(Map<String, dynamic> json) => KelolaNutrisiModel(
        status: json["Status"],
        akunId: json["akun_id"],
        idKontrolNutrisi: json["id_kontrol_nutrisi"],
        infoNutrisiId: json["info_nutrisi_id"],
        nilaiPpmInput: json["nilai_ppm_input"],
        nilaiPpmSensor: json["nilai_ppm_sensor"],
    );

   
}
