import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:video_player/video_player.dart';

class Video extends StatefulWidget {
  const Video({super.key});

  @override
  State<Video> createState() => _VideoState();
}

class _VideoState extends State<Video> {
  late VideoPlayerController controller;

  XFile? video;

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.asset("assets/videos/receipt.mp4")..initialize();
    controller.play();
  }

  @override
  void dispose() {
    controller.dispose(); // 비디오 컨트롤러 해제
    super.dispose(); // 부모 클래스의 dispose 메서드 호출
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
