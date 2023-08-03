import 'dart:convert';

import 'package:demo/consultaApi.dart';
import 'package:demo/insertarDatos.dart';
import 'package:flutter/material.dart';
import 'insertarUser.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: InsertarUser(),
    );
  }
}

