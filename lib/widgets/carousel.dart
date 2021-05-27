import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hack_app/pages/doctor_details.dart';
import 'package:hack_app/style/styles.dart';
import 'package:hack_app/utils/size_config.dart';
import 'package:hack_app/widgets/elevated_button.dart';

class Carousel extends StatefulWidget {
  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {

  var controller = PageController();
  var currentPage = 0;
  @override
  Widget build(BuildContext context) {
    controller.addListener(() {
      setState(() {
        currentPage = controller.page.round();
      });
    });
    SizeConfig().init(context);
    return _body(controller);
  }
  _body(PageController controller) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: getProportionateScreenHeight(240),
          child: PageView.builder(
            controller: controller,
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            itemCount: 3,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {Navigator.push(context, MaterialPageRoute(builder: (_) => DoctorDetails()));},
                child: Container(
                  margin: EdgeInsets.fromLTRB(
                    getProportionateScreenWidth(15),
                    getProportionateScreenHeight(5),
                    getProportionateScreenWidth(15),
                    getProportionateScreenWidth(0)
                  ),
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
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage("assets/images/doctor.png",),
                                  fit: BoxFit.cover
                              )
                              //borderRadius: BorderRadius.circular(getProportionateScreenWidth(22))
                          ),
                        ),
                        title: Text(
                          "Docteur\nKossi",
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
                            Flexible(child: dElevatedButton(() {}, "ASSISTER", primaryColor)),
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
                                child: Text("FERMER".toUpperCase(), style: textStyle.copyWith(color: primaryColor, fontSize: getProportionateScreenWidth(17)),)),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(height: getProportionateScreenHeight(10),),
        _indicators()
      ],
    );
  }

  _indicators() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(3, (int index) {
        return AnimatedContainer(
          duration: Duration(milliseconds: 200),
          height: (index == currentPage) ? 10: 8,
          width: (index == currentPage) ? 10: 8,
          margin: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(3)),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: (index == currentPage) ? primaryColor:Colors.grey.shade300
          ),
        );
      }),
    );
  }
}
