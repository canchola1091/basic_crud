

import 'package:flutter/material.dart';
import 'package:basic_crud/src/utils/utils.dart' as utils;

final ThemeData theme = ThemeData.light().copyWith(
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(color: primaryColor),
  hintColor: subTitleColor,
  disabledColor: subTitleColor,
  unselectedWidgetColor: secondaryColor,
  textSelectionTheme: TextSelectionThemeData(
    selectionColor: secondaryColor.withOpacity(0.7),
    selectionHandleColor: primaryColor,
  ),
);

final Color primaryColor = utils.hexToColor('#2DAFCE');

final Color secondaryColor = utils.hexToColor('#2a3988');

final Color subTitleColor = utils.hexToColor('#3A555B');

final Color errorColor = utils.hexToColor('#b00020');

final Color snackBarColor = utils.hexToColor('#1D363C').withOpacity(0.95);
