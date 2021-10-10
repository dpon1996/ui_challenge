import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ui_challenge/UI/ui2/ui2home.dart';
import 'package:ui_challenge/controls/deviceSize.dart';
import 'package:ui_challenge/controls/navigationHelper.dart';
import 'package:ui_challenge/supportingWidget/main_button.dart';

Color ui2MainColor = Color(0xffFF6F6E);

class UI2 extends StatefulWidget {
  @override
  _UI2State createState() => _UI2State();
}

class _UI2State extends State<UI2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ///image
          CachedNetworkImage(
            height: deviceHeight(context),
            width: deviceWidth(context),
            fit: BoxFit.cover,
            imageUrl:
                'https://assets.thehansindia.com/h-upload/2021/06/19/720x1280_1082997-world-sauntering-day-1.jpg',
          ),

          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 60),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0),
                    Colors.black.withOpacity(.2),
                    Colors.black.withOpacity(.6),
                    Colors.black.withOpacity(.9),
                    Colors.black,
                  ],
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Enjoy the world",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: deviceWidth(context) * .09,
                    ),
                  ),
                  SizedBox(height: 14),
                  Text(
                    "We'll help you to find the best\nexperience & adventure",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white70,
                      height: 1.45,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 25),
                  MainButton(
                    title: "",
                    onTap: () {
                      push(context, Ui2Home());
                    },
                    width: 52,
                    height: 52,
                    color: Colors.white,
                    radius: 12,
                    child: Icon(
                      Icons.keyboard_arrow_right,
                      color: ui2MainColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
