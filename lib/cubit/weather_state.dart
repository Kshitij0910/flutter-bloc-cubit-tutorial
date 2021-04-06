part of 'weather_cubit.dart';

// Always create states first, coz states are the reasons for creating cubit in the first place
// There is going to be an initial state, loading state (waiting for the future to complete), successful state, error state when we get an exception
@immutable
abstract class WeatherState {
  const WeatherState();
}

class WeatherInitial extends WeatherState {
  const WeatherInitial();
}

class WeatherLoading extends WeatherState {
  const WeatherLoading();
}

class WeatherLoaded extends WeatherState {
  // We want hold an actual state field in this particular class
  final Weather weather; // Weather model class
  const WeatherLoaded(this.weather);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is WeatherLoaded && o.weather == weather;
  }

  @override
  int get hashCode => weather.hashCode;
}

class WeatherError extends WeatherState {
  final String message;
  const WeatherError(this.message);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is WeatherError && o.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
