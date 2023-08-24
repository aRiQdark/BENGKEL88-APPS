import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:jobstreet/controller/controlleradmin/controllerpenjualan.dart';
import 'package:jobstreet/controller/controlleradmin/imagecontroller.dart';

class adddatabrg extends StatefulWidget {
  @override
  State<adddatabrg> createState() => _adddatabrgState();
}

class _adddatabrgState extends State<adddatabrg> {
  final add = Get.find<controllermarketAdmin>();
  final ImagePickerController imagePickerController =
      Get.put(ImagePickerController());

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        add.dateController.text = picked.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tambah data"),
        centerTitle: true,
        leading: IconButton(
            onPressed: () => Get.back(), icon: Icon(Icons.arrow_back_ios_new)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextField(
              controller: add.jdlbrg,
              decoration: InputDecoration(
                  hintText: 'judul barang', labelText: 'judul barang'),
            ),
            SizedBox(
              height: 15,
            ),
            //  TextField(
            //   controller: add.Harga,
            //   decoration: InputDecoration(

            //     hintText: 'Harga',
            //     labelText: 'Harga'
            //   ),
            // ),
            TextField(
              controller: add.Harga,
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
              controller: add.dateController,
              readOnly: true, // Membuat TextField hanya dapat dibaca
              decoration: InputDecoration(
                labelText: 'Pilih Tanggal',
                suffixIcon: GestureDetector(
                  onTap: () => selectDate(
                      context), // Tampilkan DatePicker saat ikon diklik
                  child: Icon(Icons.calendar_today),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),

            TextField(
              controller: add.deskripsi,
              decoration: InputDecoration(
                  hintText: 'Deskripsi', labelText: 'Deskripsi'),
            ),
            SizedBox(
              height: 15,
            ),

            TextField(
              controller: add.berat,
              keyboardType: TextInputType.number,
              decoration:
                  InputDecoration(hintText: 'Berat', labelText: 'Berat(KG)'),
            ),
            SizedBox(
              height: 15,
            ),
            // TextField(
            //   controller: add.stok,
            //   decoration:
            //       InputDecoration(hintText: 'status', labelText: 'status'),
            // ),
            // SizedBox(
            //   height: 15,
            // ),
            // SizedBox(
            //   height: 15,
            // ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Obx(
                () => DropdownButton(
                  isExpanded: true,
                  hint: const Text('Pilih opsi'),
                  value: add.items.contains(add.selectedOption.value)
                      ? add.selectedOption.value
                      : null,
                  onChanged: (newValue) {
                    add.selectedOption.value = newValue!;
                  },
                  items: add.items.map((option) {
                    return DropdownMenuItem(
                      child: Text(option),
                      value: option,
                    );
                  }).toList(),
                ),
              ),
            ),

            TextField(
              keyboardType: TextInputType.number,
              controller: add.status,
              decoration: InputDecoration(hintText: 'stok', labelText: 'stok'),
            ),
            SizedBox(
              height: 15,
            ),

            Obx(
              () => imagePickerController.selectedImagePath.value.isNotEmpty
                  ? Image.file(
                      File(imagePickerController.selectedImagePath.value),
                      width: 200,
                      height: 200,
                    )
                  : Container(),
            ),
            ElevatedButton(
              onPressed: () => imagePickerController.pickImage(),
              child: Text('Select Image'),
            ),

            ElevatedButton(
                onPressed: () => add.addData(
                      add.jdlbrg,
                      add.Harga,
                      add.Jam,
                      add.deskripsi,
                      add.berat,
                      add.status,
                      add.stok,
                      add.imagePickerController.selectedImagePath.string,
                    ),
                child: Text("data"))
          ],
        ),
      ),
    );
  }
}
