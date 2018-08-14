import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

final themeDataReducer = combineReducers<MaterialColor>([
  TypedReducer<MaterialColor, RefreshThemeDataAction>(resetTheme),
]);

MaterialColor resetTheme(MaterialColor themeData, action) {
  themeData = action.themeData;
  print("resetTheme-------------------------------------");
  return themeData;
}

class RefreshThemeDataAction {
  final MaterialColor themeData;

  RefreshThemeDataAction(this.themeData);
}
