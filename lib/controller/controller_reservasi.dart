import 'dart:convert';

import 'package:booking_calendar/booking_calendar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobstreet/Model/reservasi_model.dart';
import 'package:jobstreet/Model/reservasimodel.dart';
import 'package:jobstreet/controller/Auth/authentikasi.dart';

class reservasicontroller extends GetxController{
 RxList<dynamic> reservasidata = <dynamic>[].obs;
Future<List<ReservasiModel>> getdata() async {
    final Client = GetConnect();
    try {
      final response =
          await Client.get("http://192.168.100.237/backendphp/get.php");
      await Future.delayed(const Duration(seconds: 3));
      if (response.statusCode == 200) {
        print(response.body);
        final jsonData = jsonDecode(response.body) as List<dynamic>;

        final Products =
            jsonData.map((item) => ReservasiModel.fromJson(item)).toList();

        reservasidata.value = jsonData;
        return Products;
      }
      ;
    } catch (e) {
      print(e);
    }
    return [];
  }
  

}