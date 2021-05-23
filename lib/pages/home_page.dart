import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hack_app/style/styles.dart';
import 'package:hack_app/utils/size_config.dart';
import 'package:hack_app/widgets/elevated_button.dart';

class HomePage extends StatelessWidget {
  static const String routeName = "/";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          CircleAvatar(
            child: Text("s"),
            backgroundColor: greyColor,
          ),
          SizedBox(width: getProportionateScreenWidth(15),)
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(15)),
        children: [
          Text("Salut", style: textStyle),
          SizedBox(height: getProportionateScreenHeight(5),),
          Text("Dr. Yovo", style: TextStyle(fontSize: getProportionateScreenWidth(33), fontWeight: FontWeight.bold),),

          Container(
            margin: EdgeInsets.only(top: getProportionateScreenHeight(20)),
            height: getProportionateScreenHeight(240),
            alignment: Alignment.topCenter,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(getProportionateScreenWidth(30)),
              color: Colors.white
            ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15), horizontal: getProportionateScreenWidth(20)),
                  width: double.infinity,
                  height: getProportionateScreenHeight(90),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(getProportionateScreenWidth(30)),
                      topRight: Radius.circular(getProportionateScreenWidth(30))
                    ),
                    color: primaryColor
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Mes rendez-vous", style: TextStyle(color: Colors.white70, fontSize: getProportionateScreenWidth(18)),),
                      SizedBox(height: getProportionateScreenHeight(5),),
                      Row(
                        children: [
                          Icon(CupertinoIcons.clock_fill, color: Colors.white,),
                          SizedBox(width: getProportionateScreenWidth(5),),
                          Text("12 Jan 2020, 8am - 10am", style: textStyle.copyWith(color: Colors.white),)
                        ],
                      )
                    ],
                  ),
                ),
                ListTile(
                  contentPadding: EdgeInsets.all(getProportionateScreenWidth(15)),
                  leading: Container(
                    height: getProportionateScreenWidth(60),
                    width: getProportionateScreenWidth(60),
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(getProportionateScreenWidth(22))
                    ),
                  ),
                  title: Text(
                    "Louis\nPatterson",
                    style: textStyle,
                    textAlign: TextAlign.start,
                  ),
                  trailing: Icon(CupertinoIcons.info),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(15)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(child: dElevatedButton(() {}, "Accepter", primaryColor)),
                      SizedBox(width: getProportionateScreenWidth(10),),
                      TextButton(
                        style: ElevatedButton.styleFrom(
                          primary: primaryColor.withOpacity(0.1),
                          shadowColor: primaryColor.withOpacity(0.1),
                          elevation: 0,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(getProportionateScreenWidth(50))),
                          padding: EdgeInsets.symmetric(vertical: 3, horizontal: getProportionateScreenWidth(20)),
                          textStyle: textStyle.copyWith(color: Colors.white, fontSize: getProportionateScreenWidth(17))
                        ),
                        onPressed: () {},
                        child: Text("Annuler".toUpperCase(), style: textStyle.copyWith(color: primaryColor, fontSize: getProportionateScreenWidth(17)),)),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
