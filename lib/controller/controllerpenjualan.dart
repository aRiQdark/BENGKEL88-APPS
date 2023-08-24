import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:jobstreet/Model/market.dart';

import 'package:jobstreet/Model/productmodel.dart';
import 'package:jobstreet/Repository/repoAPI.dart';
import 'package:jobstreet/Utils/Loadingpage.dart';
import 'package:jobstreet/Utils/barangbaju.dart';
import 'package:lottie/lottie.dart';

class controllermarket extends GetxController {
var filteredProducts = <product>[].obs;
  RxInt index = 0.obs;
  var isLoading = true.obs;
  var selectedImagePath = ''.obs;
  RxString searchQuery = ''.obs;
  var isFavorite = false.obs;
  RxList<dynamic> listdata = <dynamic>[].obs;
  final searchcontroller = TextEditingController();
  final get = Get.find<API>();
  
  final searchController = TextEditingController();




  final filteredList = <dynamic>[].obs;

  final itemCount = 1.obs;

  void addItem() {
    itemCount.value++;
  }

  void subtractItem() {
    if (itemCount.value > 0) {
      itemCount.value--;
    }
  }

 
  Future<List<product>> getdata() async {
    final Client = GetConnect();
    try {
      final response =
          await Client.get("http://192.168.100.237/backendphp/get.php");
      await Future.delayed(const Duration(seconds: 3));
      if (response.statusCode == 200) {
        print(response.body);
        final jsonData = jsonDecode(response.body) as List<dynamic>;

        final Products =
            jsonData.map((item) => product.fromJson(item)).toList();

        listdata.value = jsonData;
        return Products;
      }
      ;
    } catch (e) {
      print(e);
    }
    return [];
  }

  void searchProduct(String searchText) {
    final filteredProducts = listdata.where((product) => 
    product.fromJson(json).lis
    ).toList();

    // TODO: Use filteredProducts as needed (e.g., update a separate list or UI)
  }


  // List<dynamic> searchData() {
  //   if (searchQuery.value.isEmpty) {
  //     return listdata.value;
  //   } else {
  //     return listdata.value
  //         .where((data) =>
  //             data["Jdl_brg"]
  //                 .toLowerCase()
  //                 .contains(searchQuery.value.toLowerCase()) ||
  //             data['Id']
  //                 .toLowerCase()
  //                 .contains(searchQuery.value.toLowerCase()))
  //         .toList();
  //   }
  // }  
  Future<List<Product>> searchData(String search) async {
  final client = GetConnect();
  try {
    final response = await client.get("http://192.168.100.237/backendphp/get.php");
    await Future.delayed(const Duration(seconds: 3));
     final jsonData = jsonDecode(response.body) as List<dynamic>;
      final filteredProducts = jsonData
          .map((item) => Product.fromJson(item))
          .where((p0) => product.fromJson(p0).jdlBrg.toLowerCase().contains(search.toLowerCase()))
          .toList();
    if (response.statusCode == 200) {
     

      return Future.delayed(Duration(seconds: 1));
    }
  } catch (e) {
    print(e);
  }
  return []; // Return an empty list if there's an error or no results
}


  @override
  void onInit() {
   
    getdata();
   
  }

  void setIndex(int value) {
    index.value = value;
  }

  void checkout() {
    Get.defaultDialog(
        middleText: "Anda yakin ingin memilih item ini ?",
        confirm: ElevatedButton(
            onPressed: () => Get.toNamed('/checkout1-penjualan'),
            child: Text("Ya")),
        cancel:
            ElevatedButton(onPressed: () => Get.back(), child: Text("Tidak")));
  }



  void sukses() {
    Future.delayed(Duration(seconds: 2));
    Get.defaultDialog(
      middleText: 'Pembayaran Terkirim',
      title: '',
      confirm: Lottie.asset('assets/lottie/tick.json'),
    );
  }

  void toggleFavorite(int index) {
    isFavorite.toggle();
  }

  void notfoundset() {
    Get.defaultDialog(middleText: 'Halaman On Going', title: 'Maaf');
  }

  void pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
    }
  }



  void TakeImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    
    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
    }
  }

  void showBarangDetailnyid(String id) {
    final barang = listdata.firstWhere((barang) => barang["Jdl_brg"] == id);
    Get.toNamed('/Detail-barang');
    print(barang);
  }

  @override
  void initState() {
    getdata();
    print(listdata);
  }

//     final FirebaseFirestore _firestore = FirebaseFirestore.instance;
// TextEditingController emailC = TextEditingController();
// TextEditingController nameC= TextEditingController();
//   Stream<QuerySnapshot> getUsers() {
//     return _firestore.collection('users').snapshots();
//   }

//   Future<void> addUser(String name, String email) {
//     return _firestore.collection('users').add({
//       'name': name,
//       'email': email,
//     });
//   }
}
