import 'dart:convert';
import 'package:get/get.dart';

class Report extends GetConnect {
  // ignore: non_constant_identifier_names
  final Url = "https://e-commerce-56778-default-rtdb.firebaseio.com/";

  Report();
  Future<Response> posting(
      String name, String spdmotor, String Deskripsi,String Jadwal ){
    final body = json.encode({
      "Nama": name,
      "jenis sepeda motor": spdmotor,
      "Deskripsi":Deskripsi,
      "Jadwal":Jadwal
    
      
    });
    return post("${Url}users.json", body );
  }

  Future<Response> postt() {
    return posting(Url,Url,Url,Url);
  }
}
