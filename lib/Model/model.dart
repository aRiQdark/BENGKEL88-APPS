import 'package:flutter/cupertino.dart';

class model {
  String nama;
  model({required this.nama});
}

class gambarmodel {
  String nama;
  Image image;
  gambarmodel({
    required this.image,
    required this.nama,
  });
}

class modelhome {
  String name;
  String profile;

  modelhome({
    required this.name,
    required this.profile,
  });
}

class modellanjutan {
  String title;

  modellanjutan({required this.title});
}
