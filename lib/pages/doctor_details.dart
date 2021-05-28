import 'package:flutter/material.dart';
import 'package:hack_app/style/styles.dart';
import 'package:hack_app/utils/size_config.dart';
import 'package:hack_app/widgets/elevated_button.dart';

class DoctorDetails extends StatefulWidget {
  static const String routeName = "/doctorDetails";
  DoctorDetails({Key key}) : super(key: key);

  @override
  _DoctorDetailsState createState() => _DoctorDetailsState();
}

class _DoctorDetailsState extends State<DoctorDetails> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(15)),
        children: [
          SizedBox(height: getProportionateScreenWidth(70),),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Dr Kossi YOVO", style: textStyle.copyWith(fontSize: getProportionateScreenWidth(30), fontWeight: FontWeight.bold),),
                  SizedBox(height: getProportionateScreenWidth(10),),
                  Text("Cardiologue", style: textStyle,),
                  Row(
                    children: [
                      Text("Experience: ", style: textStyle.copyWith(),),
                      Text("+15 ans", style: textStyle.copyWith(fontWeight: FontWeight.bold),),
                    ],
                  )
                ],
              ),
              Container(
                height: getProportionateScreenHeight(120),
                width: getProportionateScreenWidth(120),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(getProportionateScreenWidth(30)),
                  image: DecorationImage(
                      image: AssetImage("assets/images/on.jpg",),
                      fit: BoxFit.cover
                  )
                ),
              )
            ],
          ),
          SizedBox(height: getProportionateScreenWidth(40),),
          Text("Situation géographique de la clinique", style: textStyle.copyWith(fontSize: getProportionateScreenWidth(22), fontWeight: FontWeight.bold),),
          Text("Commune Golfe 3, Rue des Champions, Maison N° 485, en face du supermarché LES EPERVIERS.\nContact : 22 22 22 22.", style: textStyle, textAlign: TextAlign.start,),
          SizedBox(height: getProportionateScreenWidth(20),),
          Text("A propos", style: textStyle.copyWith(fontSize: getProportionateScreenWidth(22), fontWeight: FontWeight.bold),),
          Text("Docteur Kossi YOVO est un médecin cardiologue avec plus de 15 ans d’expérience, responsable de la clinique LA RAISON DU CŒUR. Il a pratiqué respectivement au CHU Sylvanus Olympio et Campus et à la Clinique BIASA.", style: textStyle, textAlign: TextAlign.start,),
          SizedBox(height: getProportionateScreenWidth(25),),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: getProportionateScreenWidth(10), bottom: getProportionateScreenWidth(10)),
                    height: getProportionateScreenWidth(50),
                    width: getProportionateScreenWidth(50),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage("assets/images/consultation.png",),
                          fit: BoxFit.cover
                      )
                    ),
                  ),
                  Text(
                    "Consultations",
                    style: textStyle, textAlign: TextAlign.start,
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: getProportionateScreenWidth(10), bottom: getProportionateScreenWidth(10)),
                    height: getProportionateScreenWidth(50),
                    width: getProportionateScreenWidth(50),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage("assets/images/medical-book.png",),
                            fit: BoxFit.cover
                        )
                    ),
                  ),
                  Text(
                    "Mon carnet de santé",
                    style: textStyle, textAlign: TextAlign.start,
                  )
                ],
              ),
            ],
          ),
          SizedBox(height: getProportionateScreenWidth(30),),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: getProportionateScreenWidth(10), bottom: getProportionateScreenWidth(10)),
                    height: getProportionateScreenWidth(50),
                    width: getProportionateScreenWidth(50),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage("assets/images/medical.png",),
                            fit: BoxFit.cover,
                        )
                    ),
                  ),
                  Text(
                    "Discussions",
                    style: textStyle, textAlign: TextAlign.start,
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: getProportionateScreenWidth(10), bottom: getProportionateScreenWidth(10)),
                    height: getProportionateScreenWidth(50),
                    width: getProportionateScreenWidth(50),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage("assets/images/rating.png",),
                            fit: BoxFit.cover
                        )
                    ),
                  ),
                  Text(
                    "Noter mon docteur",
                    style: textStyle, textAlign: TextAlign.start,
                  )
                ],
              ),
            ],
          ),
          SizedBox(height: getProportionateScreenWidth(100),),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(child: dElevatedButton(() {}, "Discussions", primaryColor)),
              SizedBox(width: getProportionateScreenWidth(10),),
              Flexible(child: dElevatedButton(() {}, "Appeler", Colors.red)),
            ],
          ),
        ],
      ),
    );
  }
}