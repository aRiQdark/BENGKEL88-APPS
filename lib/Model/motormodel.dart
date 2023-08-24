// To parse this JSON data, do
//
//     final motor = motorFromJson(jsonString);

import 'dart:convert';

List<Motormodel> motorFromJson(String str) => List<Motormodel>.from(json.decode(str).map((x) => Motormodel.fromJson(x)));

String motorToJson(List<Motormodel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Motormodel {
    String emailUsers;
    String jenisMotor;
    String noplat;
    String tahunbeli;
    String motorid;
    String email;
    String alamat;
    String nohp;

    Motormodel({
        required this.emailUsers,
        required this.jenisMotor,
        required this.noplat,
        required this.tahunbeli,
        required this.motorid,
        required this.email,
        required this.alamat,
        required this.nohp,
    });

    factory Motormodel.fromJson(Map<String, dynamic> json) => Motormodel(
        emailUsers: json["email_users"],
        jenisMotor: json["jenis motor"],
        noplat: json["noplat"],
        tahunbeli: json["tahunbeli"],
        motorid: json["motorid"],
        email: json["email"],
        alamat: json["alamat"],
        nohp: json["nohp"],
    );

    Map<String, dynamic> toJson() => {
        "email_users": emailUsers,
        "jenis motor": jenisMotor,
        "noplat": noplat,
        "tahunbeli": tahunbeli,
        "motorid": motorid,
        "email": email,
        "alamat": alamat,
        "nohp": nohp,
    };
}
