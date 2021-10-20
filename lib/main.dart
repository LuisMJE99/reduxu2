import 'package:ejemploex/redux/AppState.dart';
import 'package:ejemploex/redux/action.dart';
import 'package:ejemploex/redux/reducer.dart';
import 'package:ejemploex/screams/ViewRedux.dart';
import 'package:ejemploex/screams/savename.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  final store = Store<AppState>(mainReducer,
      initialState: AppState.initial(), middleware: [thunkMiddleware]);
  runApp(MyApp(store: store));
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;
  MyApp({required this.store});
  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store, 
      child: MaterialApp(
      home: Savename(),
      routes: {
        ViewRedux.id: (context) {
          return ViewRedux(onInit: () {
            StoreProvider.of<AppState>(context).dispatch(getNameAction);
          });
        }
      },
      ),
    );
  }
}