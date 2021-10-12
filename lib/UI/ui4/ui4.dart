import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:ui_challenge/UI/ui4/ui4Home.dart';
import 'package:ui_challenge/controls/deviceSize.dart';
import 'package:ui_challenge/controls/navigationHelper.dart';
import 'package:ui_challenge/supportingWidget/Qtext.dart';

class UI4 extends StatefulWidget {
  @override
  _UI4State createState() => _UI4State();
}

Color ui4MainColor = Color(0xffFA522E);

class _UI4State extends State<UI4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CachedNetworkImage(
            height: deviceHeight(context),
            width: deviceWidth(context),
            fit: BoxFit.cover,
            imageUrl:
                "https://user-images.githubusercontent.com/42827184/136995037-4773b773-fe2b-426c-94d9-0c552c98be4b.png",
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  QText(
                    "Explore the \nBeauty of Bali",
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: deviceWidth(context) * .09,
                    height: 1.25,
                  ),
                  SizedBox(height: 20),
                  QText(
                    "Find your next destination",
                    color: Colors.white,
                    // fontWeight: FontWeight.w600,
                    //fontSize: deviceWidth(context) * .09,
                  )
                ],
              ),
            ),
          ),

          ///
          Positioned(
            bottom: 30,
            left: 20,
            right: 20,
            child: GlassContainer(
              height: 65,
              border: Border.fromBorderSide(BorderSide.none),
              borderRadius: BorderRadius.circular(19),
              opacity: .05,
              blur: 10,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: QText(
                        "Discover More",
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    InkWell(
                      onTap: (){
                        push(context, Ui4Home());
                      },
                      child: Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                          color: ui4MainColor,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Icon(Icons.keyboard_arrow_right,color: Colors.white,),
                      ),
                    ),

                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
