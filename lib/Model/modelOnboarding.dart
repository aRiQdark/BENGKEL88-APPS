class Modelonboarding {
  String img;
  String title;
  String titledown;
  String txt;

  Modelonboarding({required this.titledown,required this.img, required this.title, required this.txt});
}

List<Modelonboarding> Item = [
  Modelonboarding(

      img: 'assets/images/Onboarding1-removebg-preview.png',
      title: 'E - COMMERCE',
      txt: 'Kami adalah Toko Online terbaik untuk memenuhi kebutuhan suku cadang Anda,kami bangga menyediakan berbagai produk suku cadang berkualitas tinggi untuk kendaraan Anda.', titledown: 'Pesan Sekarang'),
  Modelonboarding(
      img: 'assets/images/png-transparent-web-development-e-commerce-sales-shopping-cart-software-ecommerce-company-text-service-removebg-preview.png',
      title: 'Pembayaran Aman',
      txt: 'melakukan pembayaran tidak pernah semudah ini! Kami menawarkan solusi pembayaran yang mudah, cepat, dan praktis untuk kebutuhan Anda. Tidak perlu repot lagi dengan proses pembayaran yang rumit dan memakan waktu.', titledown: 'Secure Payment'),
  Modelonboarding(
      img: 'assets/images/quickdelivery-removebg-preview.png',
      title: 'Pengantaran Cepat',
      txt: 'Express delivery is the fastest form of shipping. The customer pays an extra shipping cost for this type of delivery', titledown: 'Quick Delivery'),
      Modelonboarding(
      img: 'assets/images/reservasi (2).png',
      title: 'Reservation',
      txt: 'Jika motor Anda membutuhkan perbaikan, jangan khawatir! Kami hadir dengan solusi reservasi perbaikan motor yang mudah dan efisien.', titledown: 'Fast Reservation'),
];
