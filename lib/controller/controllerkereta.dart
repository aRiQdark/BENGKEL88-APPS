import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get_connect/connect.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:jobstreet/Model/motormodel.dart';

class controllermotor extends GetxController{
  final searchcontroller = TextEditingController();
 RxList<dynamic> datamotor = <dynamic>[].obs;
//   Future getdatamotor() async {
//   final client = GetConnect();
//   try {
//     final response = await client.get("http://192.168.1.11/backendphp/getmotor.php");
//     await Future.delayed(const Duration(seconds: 3));
//     if (response.statusCode == 200) {
//       final jsonData = jsonDecode(response.body) as List<dynamic>;
//  final Products =
//             jsonData.map((item) => Motormodel.fromJson(item)).where((Motormodel) => Motormodel.jenisMotor.contains(searchcontroller.text)).toList();
//       // final products = jsonData
//       //     .map((item) => Products.fromJson(item))
//       //     .where((product) => product.jdl_brg.contains(keyword))
//       //     .toList();

//       return Motormodel;
//     }
//   } catch (e) {
//     print(e);
//   }
//   return [];
// }
 Future<dynamic> getdatamotor() async {
    final Client = GetConnect();
 try {
      final response =
          await Client.get("http://192.168.100.237/backendphp/getmotordata.php");
      if (response.statusCode == 200) {
        print(response.body);
        final jsonData = jsonDecode(response.body) as List<dynamic>;
        final Products =
            jsonData.map((item) =>Motormodel.fromJson(item)).toList();
        datamotor.value = jsonData;

        return Products;
      }
      ;
    } catch (e) {
      print(e);
    }
    return [];
  }
    @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
   
  }
}