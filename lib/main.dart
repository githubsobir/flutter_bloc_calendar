import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc_calendar/feature/presentation/pages/calendar_main.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then(
          (_) =>
          runApp(const MaterialApp(
            debugShowCheckedModeBanner: false,
    home: CalendarMain(),
  )));
}
