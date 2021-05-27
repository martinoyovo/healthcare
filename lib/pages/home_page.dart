import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hack_app/pages/group_chat.dart';
import 'package:hack_app/style/styles.dart';
import 'package:hack_app/utils/size_config.dart';
import 'package:hack_app/widgets/carousel.dart';
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
            backgroundColor: primaryColor,
            child: Center(
              child: Icon(CupertinoIcons.person_alt, color: Colors.white,),
            ),
          ),
          SizedBox(width: getProportionateScreenWidth(15),)
        ],
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(15)),
            child: Text("Bonjour,", style: textStyle)
          ),
          SizedBox(height: getProportionateScreenHeight(5),),
          Container(
            padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(15)),
            child: Text("Rebecca", style: TextStyle(fontSize: getProportionateScreenWidth(33), fontWeight: FontWeight.bold),)
          ),
          Carousel(),
          ListView.builder(
            padding: EdgeInsets.only(
              left: getProportionateScreenWidth(15),
              right: getProportionateScreenWidth(15),
              bottom: getProportionateScreenHeight(10),
              top: getProportionateScreenHeight(5)),
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              if(index == 0) {
                return Container(
                  margin: EdgeInsets.only(top: getProportionateScreenHeight(10)),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(getProportionateScreenWidth(30)),
                      color: Colors.white,

                  ),
                  child: ListTile(
                    onTap: () => Navigator.push(
                        context, MaterialPageRoute(builder: (_) => GroupChat())),
                    contentPadding: EdgeInsets.all(getProportionateScreenWidth(15)),
                    leading: Container(
                      height: getProportionateScreenWidth(60),
                      width: getProportionateScreenWidth(60),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage("assets/images/discussion.png",),
                              fit: BoxFit.cover
                          )
                        //borderRadius: BorderRadius.circular(getProportionateScreenWidth(22))
                      ),
                    ),
                    title: Text(
                      "Mon Forum",
                      style: textStyle,
                      textAlign: TextAlign.start,
                    ),
                    subtitle: Text(
                      "Cliquez pour demander",
                      style: textStyle.copyWith(fontSize: getProportionateScreenWidth(17)),
                      textAlign: TextAlign.start,
                    ),
                    trailing: Icon(CupertinoIcons.right_chevron),
                  ),
                );
              }
              return Container(
                margin: EdgeInsets.only(top: getProportionateScreenHeight(10)),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(getProportionateScreenWidth(30)),
                  color: Colors.white
                ),
                child: ListTile(
                  onTap: () => Navigator.push(
                    context, MaterialPageRoute(builder: (_) => GroupChat())),
                  contentPadding: EdgeInsets.all(getProportionateScreenWidth(15)),
                  leading: Container(
                    height: getProportionateScreenWidth(60),
                    width: getProportionateScreenWidth(60),
                    decoration: BoxDecoration(
                        color: primaryColor,
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage("assets/images/doctor.png",),
                            fit: BoxFit.cover
                        )
                        //borderRadius: BorderRadius.circular(getProportionateScreenWidth(22))
                    ),
                  ),
                  title: Text(
                    "Docteur $index",
                    style: textStyle,
                    textAlign: TextAlign.start,
                  ),
                  subtitle: Text(
                    "Spécialité $index",
                    style: textStyle.copyWith(fontSize: getProportionateScreenWidth(17)),
                    textAlign: TextAlign.start,
                  ),
                  trailing: Icon(CupertinoIcons.right_chevron),
                ),
              );
            }
          )
        ],
      ),
    );
  }
}
