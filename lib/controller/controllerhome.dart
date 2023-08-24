import 'package:booking_calendar/booking_calendar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobstreet/view/Allpages/Reservasi_view.dart';

class Homecontroller extends GetxController {
  final now = DateTime.now();
  var selectedOption = ''.obs;
  var statuspengiriman = ''.obs;
  List<String> statuspengirim = ['Proses', 'Dikirim', 'Selesai', 'Ditolak'];
  List <String> items= ['Menunggu', 'Disetujui','Ditolak'];
  TextEditingController Kilometer = TextEditingController();
  TextEditingController jenismotor = TextEditingController();
  TextEditingController keluhan = TextEditingController();
  TextEditingController noplat = TextEditingController();
  TextEditingController thnbeli = TextEditingController();
  TextEditingController hargabrg = TextEditingController();
  RxBool isLoading = false.obs;
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<DocumentSnapshot<Map<String, dynamic>>> strembldr() async* {
    String uid = auth.currentUser!.uid;
    
    yield* firestore.collection('bengkel88').doc(uid).snapshots();
     yield* firestore.collection('transaksi').doc(uid).snapshots();
  }
Stream<DocumentSnapshot<Map<String, dynamic>>> transaksi() async* {
    String uid = auth.currentUser!.uid;
    
     yield* firestore.collection('transaksi').doc(uid).snapshots();
  }
  Stream<DocumentSnapshot<Map<String, dynamic>>> datamotor() async* {
    String uid = auth.currentUser!.uid;
    yield* firestore.collection('reservasi').doc(uid).snapshots();
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
        .collection('reservasi')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .set({
      'email': FirebaseAuth.instance.currentUser!.email!,
      'date': now,
      'Jenis Motor': jenismotor.text,
      'Noplat': noplat.text,
      'Tahunbeli': thnbeli.text,
      'status': selectedOption.value,
    }
    
    );

    
    
  }

  @override
  void onInit() {
    super.onInit();
    selectedOption.value = statuspengirim.first;
    TextEditingController Kilometer = TextEditingController();
    TextEditingController jenismotor = TextEditingController();
    TextEditingController keluhan = TextEditingController();
    TextEditingController noplat = TextEditingController();
    TextEditingController thnbeli = TextEditingController();
  }
}
