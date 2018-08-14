import 'package:flutter/material.dart';
import 'package:flutter_app/theme_redux.dart';

class MainState {
  MaterialColor themeData;

  MainState({this.themeData});
}

MainState mainReducer(MainState state, dynamic action){
  return  MainState(
      themeData: themeDataReducer(state.themeData,action)
  );
}
