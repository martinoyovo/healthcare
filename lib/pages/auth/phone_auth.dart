import 'package:flutter/material.dart';
import 'package:hack_app/pages/home_page.dart';
import 'package:hack_app/style/styles.dart';
import 'package:hack_app/utils/size_config.dart';
import 'package:hack_app/widgets/elevated_button.dart';

class PhoneAuth extends StatefulWidget {
  static const String routeName = "/phoneAuth";

  @override
  _PhoneAuthState createState() => _PhoneAuthState();
}

class _PhoneAuthState extends State<PhoneAuth> {
  TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, getProportionateScreenHeight(130)),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(15)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: getProportionateScreenHeight(40),
                ),
                Row(
                  children: [
                    Text("Dogda",
                      style: TextStyle(
                          fontSize: getProportionateScreenWidth(30),
                          color: primaryColor,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: getProportionateScreenHeight(10),
                ),
                Text("Bienvenue sur Dogda",
                  style: TextStyle(
                      fontSize: getProportionateScreenWidth(25),
                  ),
                ),
                Text("Entrer le numéro de téléphone pour se connecter",
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(18,),
                    color: Colors.grey.shade700
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(15),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(15)),
        child: Column(
          children: [
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            TextFormField(
              controller: _phoneController,
              //maxLines: 2,
              style: textStyle,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(getProportionateScreenWidth(15)),
                border: OutlineInputBorder(),
                hintText: "96 21 42 35",
                hintStyle: textStyle.copyWith(color: Colors.grey),
                focusColor: primaryColor,
                prefixIcon: Container(
                  padding: EdgeInsets.all(getProportionateScreenWidth(15)),
                  child: Text("+228", style: textStyle,)
                )
              ),
              onChanged: (val) {
                setState(() {

                });
              },
            ),
            Spacer(),
            dElevatedButton(
                    () {Navigator.push(context, MaterialPageRoute(builder: (_) => HomePage()));},
                "Suivant",
                primaryColor
            ),
            SizedBox(height: getProportionateScreenWidth(10),)
          ],
        ),
      ),
    );
  }
}