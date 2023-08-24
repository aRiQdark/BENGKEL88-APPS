import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:jobstreet/controller/controlleradmin/controllerfirebasepenjualan.dart';

class testingfirebase extends StatefulWidget {
  
  @override
  State<testingfirebase> createState() => _testingfirebaseState();
}

class _testingfirebaseState extends State<testingfirebase> {
final controller = Get.find<firebasetest>();
Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        controller.dateController.text = picked.toString();
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
              controller: controller.Deskripsi,
              decoration: InputDecoration(
                  hintText: 'Deskripsi', labelText: 'Deskripsi'),
            ),
          TextField(
            controller: controller.namabarang,
            decoration: InputDecoration(
                hintText: 'judul barang', labelText: 'judul barang'),
          ),
          TextField(
            controller: controller.Hargabrg,
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
          TextFormField(
                controller: controller.Jam_rilis,
                
                decoration: InputDecoration(
                  labelText: 'Pilih Tanggal',
                  suffixIcon: GestureDetector(
                    onTap: () => selectDate(context),
                    child: Icon(Icons.calendar_today),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a date';
                  }
                  return null;
                },
              ),
           TextField(
              controller: controller.img,
              decoration: InputDecoration(
                  hintText: 'image', labelText: 'image'),
            ),
          ElevatedButton(
              onPressed: () => controller.postMotor(), child: Text("post"))
        ],
      ),
    );
  }
}
