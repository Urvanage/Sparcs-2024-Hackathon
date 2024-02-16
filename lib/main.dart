import 'package:flutter/material.dart';
import 'package:front/detailstore.dart';
import 'package:front/display.dart';

import 'package:front/models/store_model.dart';
import 'package:front/services/api_service.dart';
import 'package:front/storereview.dart';
import 'package:front/video.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'SUIT',
      ),
      home: const Display(),
    );
  }
}
