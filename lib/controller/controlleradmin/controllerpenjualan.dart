import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:jobstreet/Model/productmodel.dart';
import 'package:jobstreet/controller/controlleradmin/imagecontroller.dart';

class controllermarketAdmin extends GetxController {
  RxInt index = 0.obs;
  var isLoading = true.obs;
  final ImagePickerController imagePickerController =
      Get.put(ImagePickerController());
  RxString searchQuery = ''.obs;
  bool editmode = false;
  RxList<dynamic> listdata = <dynamic>[].obs;
  final searchcontroller = TextEditingController();
  TextEditingController dateController = TextEditingController();
  final jdlbrg = TextEditingController();
  final Harga = TextEditingController();
  final Jam = TextEditingController();
  final deskripsi = TextEditingController();
  final image = TextEditingController();
  final stok = TextEditingController();
  final berat = TextEditingController();
  var selectedOption = ''.obs;

  List<String> items = ['Baru', 'Bekas'];
  final status = TextEditingController();

  var selectedDate = DateTime.now().obs;

  void selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null && picked != selectedDate.value) {
      selectedDate.value = picked.toString() as DateTime;
    }
  }

  Future<void> deleteData(int id) async {
    

    final Client = GetConnect();

    try {
      // Send a DELETE request to the API endpoint with the provided ID
      final response =
          await Client.delete("http://192.168.100.237/backendphp/delete.php");
      if (response.statusCode == 200) {
        // Deletion successful
        final jsondata = jsonDecode(response.body);
        print(response.body);
        print('Data deleted successfully');
      } else {
        print('Failed to delete data. Error: ${response.statusCode}');
      }
    } catch (error) {
      // Handle general error
      print('An error occurred while deleting data: $error');
    }
  }

  Future<List<product>> getdata() async {
    final Client = GetConnect();
    try {
      final response =
          await Client.get("http://192.168.100.237/backendphp/get.php");
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

  void addData(
      TextEditingController jdlbrg,
      TextEditingController Harga,
      TextEditingController Jam,
      TextEditingController deskripsi,
      TextEditingController status,
      TextEditingController berat,
      TextEditingController stok,
      String imagePickerController) async {
    var url = Uri.parse("http://192.168.100.237/backendphp/post.php");
    var response = await http.post(url, body: {
      'jdlbrg': jdlbrg.text,
      'hrgbrg': Harga.text,
      'Deskripsi': deskripsi.text,
      'jamrilis': dateController.text,
      'Img': imagePickerController,
      'Status_brg': selectedOption.value,
      'Sisa_stok': stok.text,
      'Berat': berat.text
    });

    Get.back();

    if (response.statusCode == 200) {
      // Data was successfully added
      print("Data added!");
    } else {
      // Error occurred
      print("Error adding data: ${response.statusCode}");
    }
  }

  List<dynamic> searchData() {
    if (searchQuery.value.isEmpty) {
      return listdata.value;
    } else {
      return listdata.value
          .where((data) =>
              data["Jdl_brg"]
                  .toLowerCase()
                  .contains(searchQuery.value.toLowerCase()) ||
              data['Id']
                  .toLowerCase()
                  .contains(searchQuery.value.toLowerCase()))
          .toList();
    }
  }

  void edit() async {
    var url = Uri.parse("http://192.168.100.237/backendphp/update.php");
    var response = await http.post(url, body: {
      
      'jdlbrg': jdlbrg.text,
      'hrgbrg': Harga.text,
      'Deskripsi': deskripsi.text,
      'jamrilis': dateController.text,
      'Status_brg': selectedOption.value,
      'Sisa_stok': stok.text,
      'Berat': berat.text
    });

    Get.defaultDialog(
        cancel:
            ElevatedButton(onPressed: () => Get.back(), child: Text("Kembali")),
        confirm: ElevatedButton(
            onPressed: () {
              Get.defaultDialog(
                  content: Text("Yakin Ingin Edit Data?"),
                  confirm: ElevatedButton(
                      onPressed: () => edit(), child: Text("Lanjutkan")),
                  cancel: ElevatedButton(
                      onPressed: () => Get.back(), child: Text("Kembali")));
            },
            child: Text("Lanjutkan")),
        title: 'Edit',
        content: Column(
          children: [
            TextField(
              controller: jdlbrg,
              inputFormatters: <TextInputFormatter>[],
              decoration: InputDecoration(
                labelText: 'Judul Barang',
                hintText: 'Masukkan Judul Barang',
              ),
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              controller: Harga,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              decoration: InputDecoration(
                labelText: 'Harga',
                hintText: 'Masukkan Harga',
              ),
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              controller: deskripsi,
              decoration: InputDecoration(
                labelText: 'Deskripsi',
                hintText: 'Masukkan Deskripsi',
              ),
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              controller: berat,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Stok',
                hintText: 'Masukkan Stok',
              ),
            ),
          ],
        ));
  }

  @override
  void onInit() {
    getdata();
    searchData();
  }

  void setIndex(int value) {
    index.value = value;
  }

  void showBarangDetailnyid(String id) {
    final barang = listdata.firstWhere((barang) => barang["Id"] == id);

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
