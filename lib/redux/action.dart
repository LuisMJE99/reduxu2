import 'package:ejemploex/redux/AppState.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetNameAction {
  final dynamic _name;
  GetNameAction(this._name);

  dynamic get name => this._name;
}

ThunkAction<AppState> getNameAction = (Store<AppState> store) async {
  //
  final prefs = await SharedPreferences.getInstance();
  String name = await prefs.getString("name");
  store.dispatch(GetNameAction(name));
};
