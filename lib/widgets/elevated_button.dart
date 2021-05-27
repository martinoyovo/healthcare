import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hack_app/style/styles.dart';
import 'package:hack_app/utils/size_config.dart';

Widget dElevatedButton(VoidCallback callback, String text, Color color) {
  return Container(
    width: double.infinity,
      child: ElevatedButton(
        child: Text(text),
        style: ElevatedButton.styleFrom(
            primary: color,
            elevation: 0,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(getProportionateScreenWidth(50))),
            padding: EdgeInsets.symmetric(vertical: 3),
            textStyle: textStyle.copyWith(color: Colors.white, fontSize: getProportionateScreenWidth(17))),
        onPressed: callback
      ),
  );
}