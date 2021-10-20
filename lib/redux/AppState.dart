
class AppState {
  final dynamic name;

  AppState({this.name});

  factory AppState.initial(){
    return AppState(name: null);
  }
}
