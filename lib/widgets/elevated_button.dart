import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_mobile/core/utils/f_class.dart';
import 'package:food_mobile/core/utils/size_config.dart';

Widget FElevatedButton(BuildContext context, VoidCallback callback, String text) {
  final theme = FClass().getFTheme(context);
  return Container(
    width: double.infinity,
      //padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: ElevatedButton(
        child: Text(text),
        style: ElevatedButton.styleFrom(
            primary: theme.primaryColor,
            elevation: 0,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(getProportionateScreenWidth(0))),
            padding: EdgeInsets.symmetric(vertical: 9),
            textStyle: theme.textTheme.headline6.copyWith(fontWeight: FontWeight.w500)),
        onPressed: callback
      ),
  );
}