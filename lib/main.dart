import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Phase I/stupid_widgets.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => PageNotifier(),
      child: const MyApp(), // Flutter 程序的切入点（Entry Point）
    ),
  );
}
