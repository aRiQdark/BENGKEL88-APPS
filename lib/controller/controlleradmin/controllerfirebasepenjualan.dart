import 'package:booking_calendar/booking_calendar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobstreet/view/Allpages/Reservasi_view.dart';

class firebasetest extends GetxController {
//   final now = DateTime.now();

//   TextEditingController Kilometer = TextEditingController();
//   TextEditingController jenismotor = TextEditingController();
//   TextEditingController keluhan = TextEditingController();
//   TextEditingController noplat = TextEditingController();
//   TextEditingController thnbeli = TextEditingController();
//   RxBool isLoading = false.obs;
//   FirebaseAuth auth = FirebaseAuth.instance;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  TextEditingController Deskripsi = TextEditingController();
  TextEditingController Hargabrg = TextEditingController();
  TextEditingController Jam_rilis = TextEditingController();
  TextEditingController namabarang = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController image = TextEditingController();
   TextEditingController dateController = TextEditingController();
    final img = TextEditingController();
  Stream<DocumentSnapshot<Map<String, dynamic>>> strembldr() async* {
    FirebaseAuth auth = FirebaseAuth.instance;
    String uid = auth.currentUser!.uid;
    yield* firestore.collection('Stokbarang').doc().snapshots();
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> datamotor() async* {
    yield* firestore.collection('Stokbarang').doc().snapshots();
  }

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

  Future<void> postMotor(
    
  ) {
    Get.defaultDialog(middleText: "Update Berhasil");
    // Show a confirmation dialog if needed
    // Get.defaultDialog(
    //     middleText: "Yakin ingin update data?",
    //     confirm: ElevatedButton(
    //         onPressed: () => Get.toNamed('/motorku-detail'),
    //         child: Text("Lanjut")),
    //     cancel:
    //         ElevatedButton(onPressed: () => Get.back(), child: Text("Batal")));

    return FirebaseFirestore.instance.collection('Stokbarang').add({
      // Add your data fields here
      'Deskripsi': Deskripsi.text,
      'Harga_brg': Hargabrg.text,
      'Nama_brg': namabarang.text,
      'Jam_rilis': Jam_rilis.text,
      "image": img.text,
    });
  }
}
