import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:get/get.dart';
import 'package:jobstreet/controller/controllervideo.dart';
import 'package:youtube/youtube_thumbnail.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class videopanduan extends GetView<controllerpanduan> {
  const videopanduan({super.key});

  @override
  Widget build(BuildContext context) {
     YoutubePlayerController controllervideo = YoutubePlayerController(
      initialVideoId: 'XHODy5E03QA',
      flags: YoutubePlayerFlags(autoPlay: false, mute: false
      ));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff35BCAC),
        title: Text("Video Panduan"),
        centerTitle: true,
        leading: IconButton(
            onPressed: () => Get.back(), icon: Icon(Icons.arrow_back_ios_new)),
      ),
      body: Column(
        children: [
          Container(
            width: Get.width,
            height: 200,
            child: YoutubePlayer(
              controller: controllervideo,
            liveUIColor: Colors.amber,
            ),
          ),
          
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text("Tutorial Penggunaan Aplikasi",style: TextStyle(fontWeight: FontWeight.bold),),
        ),
        ],
      ),
    );
  }
}
