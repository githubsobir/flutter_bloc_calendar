import 'dart:convert';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_calendar/feature/domain/entities/calendar_data_model.dart';
import 'package:flutter_bloc_calendar/feature/domain/entities/calendar_enum.dart';
import 'package:flutter_bloc_calendar/feature/domain/entities/model_integr.dart';
import 'package:flutter_bloc_calendar/feature/domain/usecases/get_data_calendar.dart';
import 'package:flutter_bloc_calendar/feature/presentation/bloc/bloc_event.dart';
import 'package:flutter_bloc_calendar/feature/presentation/bloc/bloc_state.dart';

class BlocMain extends Bloc<BlocEvent, BlocState> {
  final GetCalendarData getCalendarData;

  BlocMain({required this.getCalendarData}) : super(BlocStateLoading()) {
    on<BlocEventGetData>(
      (event, emit) async {
        emit(BlocStateLoading());
        try {
          List<int> month31 = [0, 2, 4, 6, 7, 9, 11];
          List getCalendarDate = List.generate(12, (index) => index);

          int funcCalendar({required int year, required int month}) {
            for (int i = 0; i < 12; i++) {
              for (int j = 0; j < month31.length; j++) {
                if (i == month31[j]) {
                  getCalendarDate[i] = 31;
                } else {
                  if (i == 1) {
                    if (year % 4 == 0 && year % 100 != 0) {
                      getCalendarDate[i] = 29;
                    } else if (year % 400 == 0) {
                      getCalendarDate[i] = 29;
                    } else {
                      getCalendarDate[i] = 28;
                    }
                  } else {
                    getCalendarDate[i] = 30;
                  }
                }
              }

              if (month - 1 == i) {
                return getCalendarDate[i];
              }
            }
            return 31;
          }
          List<ModelIntegration> listModelIntegration = [];
          for(int i = 0; i < funcCalendar(year: 2023, month: 8); i ++){
            listModelIntegration.add(ModelIntegration(
                countDayMont: funcCalendar(year: 2023, month: 8),
                color: "",
                type: 0,
                day: i));
          }

          ModelDayCalendarData modelDayCalendarData =
              await getCalendarData.getCalendarData123();

          List<ModelCalendarEnum> listCalendarEnums =
              await getCalendarData.getCalendarEnum();


          for (int j = 0; j < listCalendarEnums.length; j++) {
            for (int i = 0; i < modelDayCalendarData.days.length; i++) {
              if (listCalendarEnums[j].type ==
                  modelDayCalendarData.days[i].type) {
                listModelIntegration[modelDayCalendarData.days[i].day]
                    .color = listCalendarEnums[j].color;
                listModelIntegration[modelDayCalendarData.days[i].day]
                    .type = modelDayCalendarData.days[i].type;
              }
            }
          }
          log(jsonEncode(listModelIntegration).toString());

          emit(BlocStateLoaded(
            listModelIntegration: listModelIntegration,
          ));
        } catch (e) {
          log(e.toString());
          emit(BlocStateError());
        }
      },
    );
  }
}
