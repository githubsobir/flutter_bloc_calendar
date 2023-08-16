import 'package:flutter_bloc_calendar/feature/data/datasources/calendar_get_data.dart';
import 'package:flutter_bloc_calendar/feature/domain/entities/calendar_data_model.dart';
import 'package:flutter_bloc_calendar/feature/domain/entities/calendar_enum.dart';

class GetCalendarData {
  final CalendarGetData _calendarGetData = CalendarGetData();

  Future<ModelDayCalendarData> getCalendarData123() async {
    return await _calendarGetData.getCalendarData();
  }

  Future<List<ModelCalendarEnum>> getCalendarEnum() async {
    return await _calendarGetData.getCalendarEnum();
  }
}
