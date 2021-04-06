import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit_bloc_tutorial/bloc/weather_bloc.dart';
import 'package:flutter_cubit_bloc_tutorial/cubit/weather_cubit.dart';
import 'package:flutter_cubit_bloc_tutorial/data/weather_repository.dart';
import 'package:flutter_cubit_bloc_tutorial/pages/weather_search_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: BlocProvider(
        create: (context) => WeatherBloc(
            FakeWeatherRepository()), // This allows us to access our weather cubit throughout our search page.
        child: WeatherSearchPage(),
      ),
    );
  }
}

// class MyChangeNotifier extends ChangeNotifier {
//   int field1;
//   String field2;

//   void changeState() {
//     field2 = 'New Value';
//     notifyListeners()
//   }
// }

// class MyState {
//   final int field1;
//   final String field2;
//   MyState(this.field1, this.field2);
// }

// class MyCubit extends Cubit<MyState> {
//   MyCubit() : super(MyState(0, 'Initial Value'));
//   void changeState() {
//     emit(MyState(0, 'New Value'));
//   }
//   // This looks suspicously similar to the MyChangeNotifier mutable state.
//   // But the cubit only holds the change state method and not the fields
//   // This emitting of state will allow us to keep us history of states just like browser history also revert back.
// }
