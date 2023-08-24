class Items {
  final String img;
  final String title;
  final String subTitle;

  ///
  Items({
    required this.img,
    required this.title,
    required this.subTitle,
  });
}

List<Items> itemPageView = [
  Items(
    img: 'assets/images/silabus 1.png',
    title: 'Silabus',
    subTitle:
        'Kampus Gratis memiliki beragam program untuk meningkatkan kompetensi dan kemampuan anda, ada Crash Program, Bootcamp, Sales Program, Credit Program, Collection Program dan lain-lain',
  ),
  Items(
    img: 'assets/images/study ku 1.png',
    title: 'STUDI-KU',
    subTitle:
        'All in one place, semua kegiatan pembelajaran kamu ada dalam satu fitur lengkap ini',
  ),
  Items(
    img: 'assets/images/diskusi 1.png',
    title: 'Diskusi Perkuliahan',
    subTitle:
        'Diskusi bersama dengan dosen yang kompeten serta rekan satu jenjang pendidikan dengan kita di Kampus Gratis',
  ),
  Items(
    img: 'assets/images/penyaluran kerja 1.png',
    title: 'Penyaluran Kerja',
    subTitle:
        'Beragam pilihan magang, pekerjaan dan project yang dapat anda pilih sesuai dengan kompetensi yang sudah anda dapatkan setelah mengikuti program di Kampus Gratis',
  ),
];
