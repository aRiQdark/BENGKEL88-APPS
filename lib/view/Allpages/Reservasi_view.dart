import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:booking_calendar/booking_calendar.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:jobstreet/Model/reservasi_model.dart';
import 'package:jobstreet/Repository/user_repository.dart';
import 'package:jobstreet/controller/Auth/authentikasi.dart';
import 'package:jobstreet/controller/controllerhome.dart';
import 'package:jobstreet/view/Allpages/reservasilist.dart';
import 'package:jobstreet/view/ViewAuth/Component/loadinglottie.dart';
import 'package:jobstreet/view/ViewAuth/Component/reservasiload.dart';

class Reservasi extends StatefulWidget {
  @override
  State<Reservasi> createState() => Reservasi_view();
}

class Reservasi_view extends State<Reservasi> {
  final now = DateTime.now();
  final reserv = Get.find<Authcontroller>();

  late BookingService mockBookingService;
  TextEditingController Kilometer = TextEditingController();
  TextEditingController jenismotor = TextEditingController();
  TextEditingController keluhan = TextEditingController();
  TextEditingController noplat = TextEditingController();
  TextEditingController thnbeli = TextEditingController();
  var selectedOption = ''.obs;
  List<String> pilihan = ['Menunggu', 'Disetujui', 'Ditolak'];
  @override
  void initState() {
    super.initState();

    mockBookingService = BookingService(
        userEmail: "${FirebaseAuth.instance.currentUser!.email!}",
        serviceName: 'Bengkel 88 tarutung',
        serviceDuration: 60,
        bookingEnd: DateTime(now.year, now.month, now.day, 18, 0),
        bookingStart: DateTime(now.year, now.month, now.day, 8, 0));
  }

  Stream<dynamic>? getBookingStreamMock(
      {required DateTime end, required DateTime start}) {
    return Stream.value([]);
  }

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  TextEditingController emailC = TextEditingController();
  TextEditingController nameC = TextEditingController();
  Stream<QuerySnapshot> getUsers() {
    return _firestore
        .collection("${FirebaseAuth.instance.currentUser!.email!}")
        .snapshots();
  }

  CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');

  List<SportBookingmodel> user = [];

  Future<void> uploadBookingMock({required BookingService newBooking}) async {
    bool shouldUpload = await showDialog(
      context: context,
      builder: (BuildContext context) {
        // Check if the TextEditingController objects have non-empty text
        bool isKilometerEmpty = Kilometer.text.trim().isEmpty;
        bool isKeluhanEmpty = keluhan.text.trim().isEmpty;

        if (isKilometerEmpty || isKeluhanEmpty) {
          String errorMessage = 'Mohon isi ';
          if (isKilometerEmpty) {
            errorMessage += 'kilometer';
            if (isKeluhanEmpty) {
              errorMessage += ' dan keluhan';
            }
          } else {
            errorMessage += 'keluhan';
          }

          SchedulerBinding.instance.addPostFrameCallback((_) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(errorMessage),
              ),
            );
          });

          return SizedBox();
        } else {
          return AlertDialog(
            title: Text('Confirmation'),
            content: Text('Anda yakin ingin melanjutkan?'),
            actions: <Widget>[
              TextButton(
                child: Text('Tidak'),
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
              ),
              TextButton(
                child: Text('Ya, lanjutkan'),
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
              ),
            ],
          );
        }
      },
    );

    if (shouldUpload == null) {
      return;
    }

    if (shouldUpload == true) {
      Get.put(Homecontroller());
      final Homectrller = Get.put<Homecontroller>(Homecontroller());

      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Center(child: CircularProgressIndicator());
        },
      );

      await Future.delayed(const Duration(seconds: 2));

      converted.add(DateTimeRange(
        start: newBooking.bookingStart,
        end: newBooking.bookingEnd,
      ));
      print('${newBooking.toJson()} has been uploaded');

      user.add(SportBookingmodel(
        email: "${FirebaseAuth.instance.currentUser!.email!}",
      ));
      print(emailC);

      // Upload to Firestore
      await FirebaseFirestore.instance
          .collection('reservasi')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({
        'email': FirebaseAuth.instance.currentUser!.email!,
        'Kilometer': Kilometer.text,
        'Keluhan': keluhan.text,
        'date': now,
        'bookingStart': newBooking.bookingStart,
        'bookingEnd': newBooking.bookingEnd,
        'status': Homectrller.selectedOption.value,
      });

      Navigator.of(context).pop(); // Close the upload dialog

      // Show a success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Reservasi Berhasil dilakukan')),
      );
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Reservasi Gagal dilakukan')));

      print('Upload cancelled');
    }
  }

  List<DateTimeRange> converted = [];

  List<DateTimeRange> convertStreamResultMock({required dynamic streamResult}) {
    DateTime first = now;
    DateTime tomorrow = now.add(Duration(
      days: 0,
    ));
    DateTime libur = now.add(Duration(days: DateTime.sunday));
    // DateTime second = now.add(const Duration(minutes: 51));
    // DateTime third = now.subtract(const Duration(minutes: 240));
    // DateTime fourth = now.subtract(const Duration(minutes: 500));
    // converted.add(
    //     DateTimeRange(start: first, end: now.add(const Duration(minutes: 1))));
    // converted.add(DateTimeRange(
    //     start: second, end: second.add(const Duration(minutes: 23))));
    // converted.add(DateTimeRange(
    //     start: third, end: third.add(const Duration(minutes: 15))));
    // converted.add(DateTimeRange(
    //     start: fourth, end: fourth.add(const Duration(minutes: 50))));

    //book whole day example
    converted.add(DateTimeRange(
        start: DateTime(tomorrow.year, tomorrow.month, tomorrow.day, 5, 0),
        end: DateTime(tomorrow.year, tomorrow.month, tomorrow.day, 23, 0)));
    return converted;
  }

  List<DateTimeRange> generatePauseSlots() {
    return [
      DateTimeRange(
          start: DateTime(now.year, now.month, now.day, 12, 0),
          end: DateTime(now.year, now.month, now.day, 13, 0))
    ];
  }

  @override
  Widget build(BuildContext context) {
    backgroundColor:
    Color(0xffF0F4FD);

    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  bool isKilometerEmpty = Kilometer.text.trim().isEmpty;
                  bool isKeluhanEmpty = keluhan.text.trim().isEmpty;
                  if (isKilometerEmpty || isKeluhanEmpty) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text(''),
                          content: Text('Mohon isi list reservasi'),
                          actions: <Widget>[
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  } else {
                    Navigator.of(context).pushNamed('/listreservasi');
                  }
                },
                // onPressed: () => Get.toNamed('/listreservasi'),
                icon: Icon(Icons.list_alt))
          ],
          leading: IconButton(
              onPressed: () => Get.back(),
              icon: Icon(Icons.arrow_back_ios_new)),
          centerTitle: true,
          backgroundColor: Colors.brown,
          title: const Text('Bengkel 88 reservasi'),
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 250,
                width: 100,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView(
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Center(
                          child: Text(
                        "Detail Service",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      )),
                      SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                          "* Update Informasi Motor Sebelum Melakukan Reservasi"),
                      SizedBox(
                        height: 5,
                      ),
                      ElevatedButton(
                          onPressed: () => Get.toNamed('/motorku'),
                          child: Text("Update detail Motor")),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        controller: Kilometer,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          fillColor: Colors.grey[500],
                          hintText: 'Masukkan Kilometer',
                          hintStyle: TextStyle(color: Colors.grey),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 20),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                        ),
                      ),

                      // SizedBox(
                      //   height: 10,
                      // ),
                      // TextField(
                      //   controller: jenismotor,
                      //   decoration: InputDecoration(
                      //     fillColor: Colors.grey[500],
                      //     hintText: 'Masukkan Jenis Motor',
                      //     hintStyle: TextStyle(color: Colors.grey),
                      //     contentPadding: EdgeInsets.symmetric(
                      //         vertical: 15, horizontal: 20),
                      //     enabledBorder: OutlineInputBorder(
                      //       borderRadius: BorderRadius.circular(10),
                      //       borderSide: BorderSide(color: Colors.black),
                      //     ),
                      //     focusedBorder: OutlineInputBorder(
                      //       borderRadius: BorderRadius.circular(10),
                      //       borderSide: BorderSide(color: Colors.blue),
                      //     ),
                      //   ),
                      // ),
                      SizedBox(
                        height: 15,
                      ),
                      TextField(
                        controller: keluhan,
                        decoration: InputDecoration(
                          fillColor: Colors.grey[500],
                          hintText: 'Isi keluhan disini',
                          hintStyle: TextStyle(color: Colors.grey),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 20),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: Get.height,
              child: BookingCalendar(
                bookingButtonText: "Mulai Booking",
                bookingService: mockBookingService,
                convertStreamResultToDateTimeRanges: convertStreamResultMock,
                getBookingStream: getBookingStreamMock,
                uploadBooking: uploadBookingMock,
                pauseSlots: generatePauseSlots(),
                pauseSlotText: 'LUNCH',
                hideBreakTime: false,
                loadingWidget: const Text('Fetching data...'),
                uploadingWidget: Reservasiload(),
                locale: 'id',
                startingDayOfWeek: StartingDayOfWeek.monday,
                wholeDayIsBookedWidget:
                    const Text('masuk ke tanggal berikutnya'),
                disabledDates: [DateTime(2023, 1, 20)],
                disabledDays: [7],
              ),
            ),
          ],
        ));
  }
}

// import 'package:booking_calendar/booking_calendar.dart';
// import 'package:date_format/date_format.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:get/get.dart';
// import 'package:jobstreet/controller/Auth/authentikasi.dart';
// import 'package:jobstreet/controller/controller.dart';

// class Reservasi extends GetView<controllertour> {

//   Reservasi({super.key});

// final reservasiC = Get.find<controllertour>();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.brown,
//         leading: IconButton(onPressed: () => Get.back(), icon: const Icon(Icons.arrow_back_ios_new,color: Colors.white,)),
//         title: const Text('Reservasi'),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: ListView(
//           children: [
//            Container(
//             height: 140,
//             width: 314,
//             decoration: BoxDecoration(color: Colors.grey,borderRadius: BorderRadius.circular(16)),
//            ) ,
//            const SizedBox(height: 24,),
//            const Text('Nama',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
//            TextFormField(
//             controller:controller.reportC ,
//            ),
//            const SizedBox(height: 34,),
//            const Text('Jenis Sepeda Motor',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
//            TextFormField(
//             controller: controller.spdmotor,
//            ),
//            const SizedBox(height: 34,),
//            const Text('Deskripsi',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
//            TextFormField(
//             controller: controller.Deskripsi,
//            ),
//            const SizedBox(height: 34,),
//            const Text('Jadwal',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
//            TextFormField(controller: controller.Jadwal,decoration: InputDecoration(
//             suffixIcon: Icon(Icons.calendar_month_outlined)
//            ),

//            onTap: () async{
//              DateTime? pickdate = await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2000), lastDate: DateTime(2100),

//              );
//              if(pickdate != null){
//                  String formattedDate = formatDate((pickdate), [yyyy, '-', mm, '-', dd]);
//                   controller.Jadwal = TextEditingController(text: formattedDate);
//              }else{}
//            },
//            ),

// SizedBox(height: 10,),

//            const SizedBox(height: 30,),
//            ElevatedButton(onPressed: () =>reservasiC.add(controller.reportC.text,controller.spdmotor.text,controller.spdmotor.text,controller.Deskripsi.text,controller.Jadwal.text), child: const Text('Kirim')),

//           ],
//         ),
//       ),
//     );
//   }
// }
