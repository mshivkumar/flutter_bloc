import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:testapp/models/custom_error.dart';
import 'package:testapp/models/weather.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherState.initial());
}
