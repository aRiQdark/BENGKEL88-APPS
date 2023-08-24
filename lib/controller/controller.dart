import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:jobstreet/Repository/Repository.dart';

// ignore: camel_case_types
class controllertour extends GetxController {
 
  late TextEditingController reportC;
  late TextEditingController spdmotor;
  late TextEditingController Deskripsi;
  late TextEditingController Jadwal;
  void add(String nama, String text,String spdmotor,String Deskripsi,String Jadwal) {
    Report().posting(nama,spdmotor,Deskripsi,Jadwal);




    Get.defaultDialog(
      title: "Reservasi Telah Dikirimkan",
      middleText: "Reservasi pada $Jadwal",
      onConfirm: () {
        Get.back();
        Get.back();
      },
    );
  }



  @override
  void onInit() {
    super.onInit();
    reportC = TextEditingController();
    Deskripsi = TextEditingController();
    spdmotor = TextEditingController();
     Jadwal = TextEditingController();
  }

  @override
  void onClose() {
   spdmotor.dispose();
   Deskripsi.dispose();
    super.onClose();
    reportC.dispose();
    Jadwal.dispose();
  }
}
  
//  void datePicker(BuildContext context) async {
//     DateTime? pickedDate = await showDatePicker(
//         context: context,
//         initialDate: DateTime.now(),
//         firstDate: DateTime(1900),
//         lastDate: DateTime.now());
//     if (pickedDate != null) {
//       String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
//       birthDateController.value = TextEditingController(text: formattedDate);
//     } else {};