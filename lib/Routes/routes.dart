import 'package:get/get.dart';
import 'package:jobstreet/Binding/LogIn/Binding.dart';
import 'package:jobstreet/Binding/bindingAdmin/bindingmarket.dart';
import 'package:jobstreet/Binding/bindingAdmin/bindingpemesanan.dart';

import 'package:jobstreet/Binding/bindingHome.dart';
import 'package:jobstreet/Binding/bindingdescription.dart';
import 'package:jobstreet/Binding/bindinglupapassword.dart';
import 'package:jobstreet/Binding/bindingmarket.dart';
import 'package:jobstreet/Binding/bindingmotor.dart';
import 'package:jobstreet/Binding/bindingprofile.dart';
import 'package:jobstreet/Binding/bindingsignup.dart';
import 'package:jobstreet/Binding/firebase.dart';
import 'package:jobstreet/Binding/panduanbinding.dart';

import 'package:jobstreet/Routes/routename.dart';
import 'package:jobstreet/controller/controllerhome.dart';
import 'package:jobstreet/view/Allpages/Motorsaya/motorsayadetaul.dart';
import 'package:jobstreet/view/Allpages/Motorsaya/motorsayaview.dart';
import 'package:jobstreet/view/Allpages/Panduan/Buku_panduan.dart';
import 'package:jobstreet/view/Allpages/Penjualan/Detailpenjualan.dart';
import 'package:jobstreet/view/Allpages/Panduan/Panduan_1.dart';
import 'package:jobstreet/view/Allpages/Penjualan/Penjualan.dart';
import 'package:jobstreet/view/Allpages/Penjualan/checkout-penjualan.dart';
// import 'package:jobstreet/view/Allpages/Penjualan/checkout/checkout-penjualan.dart';
import 'package:jobstreet/view/Allpages/Penjualan/deskripsifirebase.dart';
import 'package:jobstreet/view/Allpages/Penjualan/pembayaran.dart';
import 'package:jobstreet/view/Allpages/Penjualan/penjualanfirebase.dart';
import 'package:jobstreet/view/Allpages/Penjualan/rincianpenjualan.dart';
import 'package:jobstreet/view/Allpages/Penjualan/testadmin.dart';
import 'package:jobstreet/view/Allpages/Profile.dart';
import 'package:jobstreet/view/Allpages/Reservasi_view.dart';
import 'package:jobstreet/view/Allpages/chat/chat.dart';

import 'package:jobstreet/view/Allpages/Panduan/videopanduan.dart';
import 'package:jobstreet/view/Allpages/informasi-bengkel/informasibengkel-detail.dart';
import 'package:jobstreet/view/Allpages/informasi-bengkel/informasibngkl.dart';
import 'package:jobstreet/view/Allpages/reservasilist.dart';
import 'package:jobstreet/view/Profile/Profile.dart';
import 'package:jobstreet/view/Profile/gantipassword.dart';

import 'package:jobstreet/view/View.dart';
import 'package:jobstreet/view/ViewAuth/Auth/Registrasi.dart';
import 'package:jobstreet/view/ViewAuth/Auth/resetpassword.dart';
import 'package:jobstreet/view/ViewAuth/Onboarding/Onboarding.dart';
import 'package:jobstreet/view/ViewAuth/Auth/login.dart';
import 'package:jobstreet/view/allpagesadmin/Reservasi.dart';
import 'package:jobstreet/view/allpagesadmin/adddata.dart';
import 'package:jobstreet/view/allpagesadmin/mainpageadmin.dart';
import 'package:jobstreet/view/allpagesadmin/pemesanan.dart';
import 'package:jobstreet/view/allpagesadmin/pemesananbrg.dart';

import '../view/Allpages/cart/pembayaran-detail.dart';

class TourRout {
  static const Home = routename.Home;
  static const Onboarding = '/Onboarding';
  static final Page = [
    GetPage(
        name: routename.Home,
        page: () => View(),
        binding: bindingMarket(),
        transition: Transition.downToUp),
    GetPage(
      name: '/Profile',
      page: () => const Profile(),
      binding: signupbinding()
    ),
    GetPage(name: '/Home', page: () => View(), transition: Transition.fadeIn),
    GetPage(
        name: '/Onboarding',
        page: () => Boarding(),
        binding: OnboardingBinding(),
        transition: Transition.downToUp),
    GetPage(
        name: '/Log-in',
        page: () => Login(),
        binding: LoginBinding(),
        transition: Transition.cupertinoDialog),
    GetPage(
        name: '/Registrasi',
        page: () => Registrasi(),
        binding: signupbinding(),
        transition: Transition.topLevel),
    GetPage(
        name: '/Reservasi',
        page: () => Reservasi(),
        transition: Transition.cupertino,
        binding: bindingreservasi()),
    GetPage(
        name: '/Profilecustomer',
        page: () => Profilecustomer(),
        binding: profilebinding(),
        transition: Transition.cupertinoDialog),
    GetPage(
        name: '/Market',
        page: () => Market(),
        transition: Transition.cupertino,
        binding: bindingMarket()),
    GetPage(
        name: '/Reset-password',
        page: () => resetpass(),
        transition: Transition.cupertino,
        binding: resetpasswordbinding()),
    GetPage(
        name: '/Detail-barang',
        page: () => DetailbarangState(),
        transition: Transition.cupertino,
        binding: bindingMarket()),
    GetPage(
      name: '/chat-admin',
      page: () => Chat(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: '/panduan',
      page: () => Panduan(),
      binding: bindingMarket(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: '/panduan-video',
      page: () => videopanduan(),
      binding: bindingpanduan(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: '/panduan-buku',
      page: () => Bukupanduan(),
      binding: bindingpanduan(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: '/informasi-bengkel',
      page: () => Informasi(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: '/informasi-bengkel-detail',
      page: () => Detailinformasi(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: '/checkout-penjualan',
      page: () => Checkout(),
      binding: marketbinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: '/checkout1-penjualan',
      page: () => Checkout(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: '/rincian-penjualan',
      page: () => rincianpenjualan(),
      binding: bindingMarket(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: '/pembayaran',
      page: () => Pembayaran(),
      binding: bindingMarket(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: '/listreservasi',
      page: () => listreservasi(),
      binding: bindingreservasi(),
      transition: Transition.cupertino,
    ),
    GetPage(
        name: '/Gantipass',
        page: () => Gantipass(),
        transition: Transition.cupertino,
        binding: resetpasswordbinding()),
    GetPage(
      name: '/motorku',
      page: () => motorku(),
      binding: bindingmotor(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: '/motorku-detail',
      page: () => MotorSayaDetail(),
      binding: bindingmotor(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: '/beranda-admin',
      page: () => berandaAdmin(),
      transition: Transition.cupertino,
    ),
       GetPage(
        name: '/pemesanan-barang-Admin',
        page: () => addbarang(),
        binding: marketbinding(),
        transition: Transition.downToUp),
    GetPage(
        name: '/Add-barang-Admin',
        page: () => adddatabrg(),
        binding: marketbinding(),
        transition: Transition.downToUp),
         GetPage(
        name:'/peneriman-barang-Admin',
        // page: () => Pemesanan(),
        page: () => pemesanan(),
        binding:pemesananbinding(),
        transition: Transition.downToUp),
          GetPage(
        name:'/Reservasi-Admin',
        page: () => Reservasiadmin(),
        binding: bindingreservasi(),
        transition: Transition.downToUp),
         GetPage(
        name:'/firebase-stokbarang',
        page: () => firebasepenjualan(),
        binding: firebasebindingstok(),
        transition: Transition.downToUp),
         GetPage(
        name:'/firebase',
        page: () => testingfirebase(),
        binding: firebasebindingstok(),
        transition: Transition.downToUp),
        // GetPage(
        // name:'/firebase-detail-barang',
        // page: () => firebaseDetailbarang(),
        // binding: firebasebindingstok(),
        // transition: Transition.downToUp),
        GetPage(
        name:'/pembayaran_detail',
        page: () => pembayaran_Detail(),
        
        transition: Transition.downToUp),
        
  ];
}
