// To parse this JSON data, do
//
//     final pemesananmodel = pemesananmodelFromJson(jsonString);

import 'dart:convert';

List<Pemesananmodel> pemesananmodelFromJson(String str) => List<Pemesananmodel>.from(json.decode(str).map((x) => Pemesananmodel.fromJson(x)));

String pemesananmodelToJson(List<Pemesananmodel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Pemesananmodel {
    String emailUsers;
    String jenisMotor;
    String noplat;
    DateTime tahunbeli;
    String motorid;
    String email;
    String alamat;
    String nohp;

    Pemesananmodel({
        required this.emailUsers,
        required this.jenisMotor,
        required this.noplat,
        required this.tahunbeli,
        required this.motorid,
        required this.email,
        required this.alamat,
        required this.nohp,
    });

    factory Pemesananmodel.fromJson(Map<String, dynamic> json) => Pemesananmodel(
        emailUsers: json["email_users"],
        jenisMotor: json["jenis motor"],
        noplat: json["noplat"],
        tahunbeli: DateTime.parse(json["tahunbeli"]),
        motorid: json["motorid"],
        email: json["email"],
        alamat: json["alamat"],
        nohp: json["nohp"],
    );

    Map<String, dynamic> toJson() => {
        "email_users": emailUsers,
        "jenis motor": jenisMotor,
        "noplat": noplat,
        "tahunbeli": "${tahunbeli.year.toString().padLeft(4, '0')}-${tahunbeli.month.toString().padLeft(2, '0')}-${tahunbeli.day.toString().padLeft(2, '0')}",
        "motorid": motorid,
        "email": email,
        "alamat": alamat,
        "nohp": nohp,
    };
}
