// To parse this JSON data, do
//
//     final pemesananmodel = pemesananmodelFromJson(jsonString);

import 'dart:convert';

List<Pemesananmodel> pemesananmodelFromJson(String str) => List<Pemesananmodel>.from(json.decode(str).map((x) => Pemesananmodel.fromJson(x)));

String pemesananmodelToJson(List<Pemesananmodel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Pemesananmodel {
    String idTransaksi;
    String username;
    String alamat;
    String hargabrg;
    String jdlBrg;

    Pemesananmodel({
        required this.idTransaksi,
        required this.username,
        required this.alamat,
        required this.hargabrg,
        required this.jdlBrg,
    });

    factory Pemesananmodel.fromJson(Map<String, dynamic> json) => Pemesananmodel(
        idTransaksi: json["id_transaksi"],
        username: json["username"],
        alamat: json["Alamat"],
        hargabrg: json["Hargabrg"],
        jdlBrg: json["jdl_brg"],
    );

    Map<String, dynamic> toJson() => {
        "id_transaksi": idTransaksi,
        "username": username,
        "Alamat": alamat,
        "Hargabrg": hargabrg,
        "jdl_brg": jdlBrg,
    };
}
