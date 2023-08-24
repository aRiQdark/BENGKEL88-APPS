// To parse this JSON data, do
//
//     final reservasi = reservasiFromJson(jsonString);

import 'dart:convert';

List<ReservasiModel> reservasiFromJson(String str) => List<ReservasiModel>.from(json.decode(str).map((x) => ReservasiModel.fromJson(x)));

String reservasiToJson(List<ReservasiModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ReservasiModel {
    String userid;
    String username;
    String useremail;
    String nomorhp;
    String serviceid;
    String servicename;
    String serviceduration;
    String serviceprice;
    DateTime bookingstart;
    DateTime bookingend;

    ReservasiModel({
        required this.userid,
        required this.username,
        required this.useremail,
        required this.nomorhp,
        required this.serviceid,
        required this.servicename,
        required this.serviceduration,
        required this.serviceprice,
        required this.bookingstart,
        required this.bookingend,
    });

    factory ReservasiModel.fromJson(Map<String, dynamic> json) => ReservasiModel(
        userid: json["userid"],
        username: json["username"],
        useremail: json["useremail"],
        nomorhp: json["nomorhp"],
        serviceid: json["serviceid"],
        servicename: json["servicename"],
        serviceduration: json["serviceduration"],
        serviceprice: json["serviceprice"],
        bookingstart: DateTime.parse(json["bookingstart"]),
        bookingend: DateTime.parse(json["bookingend"]),
    );

    Map<String, dynamic> toJson() => {
        "userid": userid,
        "username": username,
        "useremail": useremail,
        "nomorhp": nomorhp,
        "serviceid": serviceid,
        "servicename": servicename,
        "serviceduration": serviceduration,
        "serviceprice": serviceprice,
        "bookingstart": "${bookingstart.year.toString().padLeft(4, '0')}-${bookingstart.month.toString().padLeft(2, '0')}-${bookingstart.day.toString().padLeft(2, '0')}",
        "bookingend": "${bookingend.year.toString().padLeft(4, '0')}-${bookingend.month.toString().padLeft(2, '0')}-${bookingend.day.toString().padLeft(2, '0')}",
    };
}
