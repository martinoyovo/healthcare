import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hack_app/fake_datas/group_chat_datas.dart';
import 'package:hack_app/style/styles.dart';
import 'package:hack_app/utils/size_config.dart';

class GroupChat extends StatefulWidget {
  static const String routeName = "/groupChat";
  GroupChat({Key key}) : super(key: key);

  @override
  _GroupChatState createState() => _GroupChatState();
}

class _GroupChatState extends State<GroupChat> {
  TextEditingController _textEditingController = TextEditingController();
  String _textFieldVal = "";
  int patientId = 4;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        automaticallyImplyLeading: false,
        iconTheme: IconThemeData(
          color: Colors.black
        ),
        leading: IconButton(
          icon: Icon(CupertinoIcons.arrow_left,),
          onPressed: () => Navigator.pop(context),
        ),
        elevation: 0,
        title: Text("Forum", style: TextStyle(color: Colors.black),),
      ),
      body: Stack(
        children: [
          ListView(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(15)),
            children: [
              ListView.builder(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.only(top: getProportionateScreenWidth(10), bottom: getProportionateScreenWidth(70)),
                shrinkWrap: true,
                itemCount: groupChatDatas.length,
                itemBuilder: (c, i) {
                  final chatData = groupChatDatas[i];
                  return Column(
                    crossAxisAlignment: patientId == chatData["from"]["id"] ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${chatData["date"].toString()} - ${chatData["from"]["name"]}",
                      ),
                      Container(
                        //alignment: patientId == chatData["from"]["id"] ? Alignment.centerRight:Alignment.centerLeft,
                        margin: EdgeInsets.only(
                          left: patientId == chatData["from"]["id"] ? getProportionateScreenWidth(30) : 0,
                          right: patientId == chatData["from"]["id"] ? 0 : getProportionateScreenWidth(30),
                          top: getProportionateScreenWidth(4),
                          bottom: getProportionateScreenWidth(20),
                        ),
                        padding: EdgeInsets.all(getProportionateScreenWidth(12)),
                        decoration: BoxDecoration(
                          color: patientId == chatData["from"]["id"] ? primaryColor : greyColor.withOpacity(0.6),
                          borderRadius: BorderRadius.circular(getProportionateScreenWidth(15))
                        ),
                        child: Text(
                          chatData["text"],
                          style: textStyle.copyWith(color: patientId == chatData["from"]["id"] ? Colors.white: Colors.black),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  );
                })
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              color: bgColor,
              padding: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width*0.8,
                    padding: EdgeInsets.only(
                      left: getProportionateScreenWidth(10),
                      right: getProportionateScreenWidth(0),
                      top: getProportionateScreenWidth(0),
                      bottom: getProportionateScreenWidth(0),
                    ),
                    decoration: BoxDecoration(
                      color: greyColor.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(getProportionateScreenWidth(20))
                    ),
                    child: TextFormField(
                      controller: _textEditingController,
                      //maxLines: 2,
                      style: textStyle,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          vertical: getProportionateScreenWidth(0),
                          horizontal: getProportionateScreenWidth(10)
                        ),
                        border: InputBorder.none,
                        hintText: "Entrer le message",
                        hintStyle: textStyle.copyWith(color: Colors.grey),
                      ),
                      onChanged: (val) {
                        setState(() {
                          _textFieldVal = val;
                        });
                        print(_textFieldVal);
                      },
                    ),
                  ),
                  SizedBox(width: getProportionateScreenWidth(6),),
                  InkWell(
                    onTap: () {

                    },
                    child : Container(
                      height: getProportionateScreenHeight(45),
                      width: getProportionateScreenHeight(45),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _textEditingController.text.isEmpty ?
                        greyColor.withOpacity(0.6): primaryColor,
                      ),
                      child: Icon(CupertinoIcons.arrow_up, color: _textEditingController.text.isEmpty ? Colors.grey.shade600: Colors.white,),
                    )
                  )
                ],
              ),
            )
          )
        ],
      ),
    );
  }
}