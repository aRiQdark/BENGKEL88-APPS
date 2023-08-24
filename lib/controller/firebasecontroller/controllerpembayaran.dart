import 'package:booking_calendar/booking_calendar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobstreet/view/Allpages/Reservasi_view.dart';

class Pembayaranfirebasecontroller extends GetxController {
  final now = DateTime.now();
  var selectedOption = ''.obs;

  List <String> items= ['Menunggu', 'Disetujuin','Ditolak'];
  TextEditingController Kilometer = TextEditingController();
  TextEditingController jenismotor = TextEditingController();
  TextEditingController keluhan = TextEditingController();
  TextEditingController noplat = TextEditingController();
  TextEditingController thnbeli = TextEditingController();
  RxBool isLoading = false.obs;
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;


  Stream<DocumentSnapshot<Map<String, dynamic>>> datamotor() async* {
    String uid = auth.currentUser!.uid;
    yield* firestore.collection('transaksi').doc(uid).snapshots();
  }

  Future<void> Postmotor() async {
    Get.toNamed('/motorku-detail');
  
    Get.defaultDialog(middleText: "Update Berhasil");
    // Get.defaultDialog(
    //     middleText: "Yakin ingin update data?",
    //     confirm: ElevatedButton(
    //         onPressed:  () => Get.toNamed('/motorku-detail'),
    //         child: Text("Lanjut")),
    //     cancel:
    //         ElevatedB utton(onPressed: () => Get.back(), child: Text("Batal")));
    return FirebaseFirestore.instance
        .collection('transaksi')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .set({
      'Nama Pembeli': FirebaseAuth.instance.currentUser!.email!,
      'Nama Barang': now,
      'Alamat': jenismotor.text,
      'Harga Barang': noplat.text,
      'Status': thnbeli.text,
      'status User': selectedOption.value,
    }
    
    );
    
  }

  @override
  void onInit() {
    super.onInit();
    TextEditingController Kilometer = TextEditingController();
    TextEditingController jenismotor = TextEditingController();
    TextEditingController keluhan = TextEditingController();
    TextEditingController noplat = TextEditingController();
    TextEditingController thnbeli = TextEditingController();
  }
}
