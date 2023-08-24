// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

List<product> productFromJson(String str) => List<product>.from(json.decode(str).map((x) => product.fromJson(x)));

String productToJson(List<product> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class product {
    String idBrg;
    String jdlBrg;
    String hargaBrg;
    String deskripsi;
    DateTime jamRilis;
    String img;

    product({
        required this.idBrg,
        required this.jdlBrg,
        required this.hargaBrg,
        required this.deskripsi,
        required this.jamRilis,
        required this.img,
    });

    factory product.fromJson(Map<String, dynamic> json) => product(
        idBrg: json["id_brg"],
        jdlBrg: json["Jdl_brg"],
        hargaBrg: json["Harga_brg"],
        deskripsi: json["Deskripsi"],
        jamRilis: DateTime.parse(json["Jam_rilis"]),
        img: json["img"],
    );

    Map<String, dynamic> toJson() => {
        "id_brg": idBrg,
        "Jdl_brg": jdlBrg,
        "Harga_brg": hargaBrg,
        "Deskripsi": deskripsi,
        "Jam_rilis": "${jamRilis.year.toString().padLeft(4, '0')}-${jamRilis.month.toString().padLeft(2, '0')}-${jamRilis.day.toString().padLeft(2, '0')}",
        "img": img,
    };
}
