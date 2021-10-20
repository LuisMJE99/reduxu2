import 'package:ejemploex/redux/AppState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class ViewRedux extends StatefulWidget {
  static const String id = "ViewRedux";
  final void Function() onInit;
  ViewRedux({required this.onInit});
  @override
  _ViewReduxState createState() => _ViewReduxState();
}

class _ViewReduxState extends State<ViewRedux> {
  void initState() {
    super.initState();
    widget.onInit();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
        converter: (store) => store.state,
        builder: (context, state) {
          return Scaffold(
            body: Center(child: Text(state.name)),
          );
        });
   
  }
}
