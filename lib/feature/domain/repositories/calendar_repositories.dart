import 'package:flutter_bloc_calendar/feature/domain/entities/calendar_data_model.dart';
import 'package:flutter_bloc_calendar/feature/domain/entities/calendar_enum.dart';

abstract class CalendarRepositories {

  Future<ModelDayCalendarData> getData();

  Future<List<ModelCalendarEnum>> getDataEnum();
}
