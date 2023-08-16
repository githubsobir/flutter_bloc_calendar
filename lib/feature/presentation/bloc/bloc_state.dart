import 'package:flutter_bloc_calendar/feature/domain/entities/calendar_data_model.dart';
import 'package:flutter_bloc_calendar/feature/domain/entities/calendar_enum.dart';
import 'package:flutter_bloc_calendar/feature/domain/entities/model_integr.dart';

abstract class BlocState {}

class BlocStateLoading extends BlocState {}

class BlocStateLoaded extends BlocState {

  List<ModelIntegration> listModelIntegration;

  BlocStateLoaded({required this.listModelIntegration});
}

class BlocStateError extends BlocState {}
