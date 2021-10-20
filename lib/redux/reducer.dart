import 'package:ejemploex/redux/AppState.dart';
import 'package:ejemploex/redux/action.dart';

AppState mainReducer(state, action) {
  return AppState(name: nameReducer(state.name, action));
}

nameReducer(name, action) {
  if (action is GetNameAction) {
    return action.name;
  }
  return name;
}
