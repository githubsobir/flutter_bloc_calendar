import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc_calendar/feature/domain/entities/calendar_data_model.dart';
import 'package:flutter_bloc_calendar/feature/domain/entities/calendar_enum.dart';

class CalendarGetData {
  /// calendar data
  Future<ModelDayCalendarData> getCalendarData() async {
    var dio = Dio();
    Response response;
    response = await dio.get("https://www.jsonkeeper.com/b/92TT");
    log(jsonEncode(response.data).toString());
    return ModelDayCalendarData.fromJson(response.data);
  }

  /// enums
  Future<List<ModelCalendarEnum>> getCalendarEnum() async {
    var dio = Dio();
    Response response;
    response = await dio.get("https://www.jsonkeeper.com/b/I86U");
    log(jsonEncode(response.data).toString());
    return (response.data as List)
        .map((e) => ModelCalendarEnum.fromJson(e))
        .toList();
  }
}
