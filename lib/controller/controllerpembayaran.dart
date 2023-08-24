import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:jobstreet/Model/pembayaranmodel.dart';
import 'package:jobstreet/Repository/repoAPI.dart';
import 'package:jobstreet/controller/controllerpenjualan.dart';
import 'package:jobstreet/view/Allpages/Penjualan/pembayaran.dart';
import 'package:lottie/lottie.dart';

class controllerpembayaran extends GetxController {
  final conn = Get.find<controllermarket>();
 final testalamat = Get.lazyPut(() => PembayaranState());
  
   final get = Get.find<API>();
  RxList<dynamic> listpemesanan = <dynamic>[].obs;
  TextEditingController Username = TextEditingController(text: FirebaseAuth.instance.currentUser!.email);
  final Almt = TextEditingController();
final alamat = TextEditingController();
  final Hrg = TextEditingController();
  final jdlbrang = TextEditingController();

  Future<List<Pemesananmodel>> getdata() async {
    final Client = GetConnect();

    try {
      final response =
          await Client.get(get.ApiconnectGetpembayaran);
      if (response.statusCode == 200) {
        print(response.body);
        final jsonData = jsonDecode(response.body) as List<dynamic>;
        final Products =
            jsonData.map((item) => Pemesananmodel.fromJson(item)).toList();
        listpemesanan.value = jsonData;

        return Products;
      }
      ;
    } catch (e) {
      print(e);
    }
    return [];
  }

  void addData(
    TextEditingController username ,
    TextEditingController alamat,
    TextEditingController hargabrg,
    TextEditingController judulbrang,
  ) async {
    
    Get.lazyPut(()=>PembayaranState());
    var url = Uri.parse(get.APIconnectPost);
    var response = await http.post(url, body: {
      // 'username': username.text,
      // 'Alamat': alamat.text,
      // 'jargabrg': hargabrg.text,
      // 'jdl_brg': jdlbrang.text
      'Username': username.text,
      'alamat': alamat.text,
      'Hargabrg': hargabrg.text,
      "jdl_brg": judulbrang.text,
    });

    if (response.statusCode == 200) {
      await Future.delayed(Duration(seconds: 2));
      Get.defaultDialog(
        middleText: 'Pembayaran Terkirim',
        title: '',
        confirm: Lottie.asset('assets/lottie/tick.json'),
      );
      // Data was successfully added
      print("Data added!");
    } else {
      // Error occurred
      print("Error adding data: ${response.statusCode}");
    }
  }
}
