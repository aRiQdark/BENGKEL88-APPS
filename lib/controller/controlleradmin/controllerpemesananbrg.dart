import 'dart:convert';


import 'package:get/get.dart';
import 'package:jobstreet/Model/pembayaranmodel.dart';


class pemesanancontroller extends GetxController {
    RxList<dynamic> listpemesanan = <dynamic>[].obs;
Future<List<Pemesananmodel>> getdata() async {
    final Client = GetConnect();
 
    try {
      final response =
          await Client.get("http://192.168.100.237/backendphp/gettransaksi.php");
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

}
