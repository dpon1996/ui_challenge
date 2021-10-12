import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:readmore/readmore.dart';
import 'package:ui_challenge/UI/ui4/ui4.dart';
import 'package:ui_challenge/controls/deviceSize.dart';
import 'package:ui_challenge/supportingWidget/Qtext.dart';
import 'package:ui_challenge/supportingWidget/main_button.dart';

class Ui4Home extends StatefulWidget {
  @override
  _Ui4HomeState createState() => _Ui4HomeState();
}

class _Ui4HomeState extends State<Ui4Home> {
  List places = [
    {
      "img":
          "https://cms.lonelyplanet.com/sites/default/files/brightcove/videos/images/posters/5104226627001_5708861247001_5708116457001-vs.jpg",
      "name": "Ubud",
      "loc": "known for its Monkey Forest"
    },
    {
      "img":
          "https://apicms.thestar.com.my/uploads/images/2020/10/01/881480.jpg",
      "name": "Balangan Beach",
      "loc": "Bustling resort area in Bali"
    },
    {
      "img":
          "https://img.jakpost.net/c/2019/03/19/2019_03_19_67991_1552969698._large.jpg",
      "name": "Ubud",
      "loc": "known for its Monkey Forest"
    },
    {
      "img":
          "https://cdn.kimkim.com/files/a/content_articles/featured_photos/a6feea9f9bc05fc2b1eeeeb11d9d632bc9c3d3e7/big-7df6d3d61649ff1fa4c85ca22a70aa5f.jpg",
      "name": "Balangan Beach",
      "loc": "Bustling resort area in Bali"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          CachedNetworkImage(
            height: deviceHeight(context) * .7,
            width: double.infinity,
            fit: BoxFit.cover,
            imageUrl:
                "https://user-images.githubusercontent.com/42827184/137001132-874e31eb-53bd-49b2-8ce8-fc303e2c4bec.png",
          ),


          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: CachedNetworkImage(
              height: deviceHeight(context) * .5,
              fit: BoxFit.cover,
              imageUrl:
              "https://user-images.githubusercontent.com/42827184/137007984-b60bfccd-ae87-4dc0-8a68-67dab3002df5.png",
            ),
          ),

          Positioned(
            bottom: 0,
            right: 0,
            child: CachedNetworkImage(
              height: deviceHeight(context) * .8,
              fit: BoxFit.cover,
              imageUrl:
                  "https://user-images.githubusercontent.com/42827184/137007973-14b060f4-302b-4e2e-b2e3-4cfa887ffb0c.png",
            ),
          ),



          ///
          SingleChildScrollView(
            padding: EdgeInsets.only(top: deviceHeight(context) * .4),
            child: GlassContainer(
              blur: 10,
              border: Border.fromBorderSide(BorderSide.none),
              borderRadius: BorderRadius.circular(19),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16),
                  Center(
                    child: Container(
                      height: 5,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white.withOpacity(.15),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        QText(
                          "Bali",
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(height: 3),
                        QText("Island in Indonesia", color: Colors.white),
                        SizedBox(height: 13),
                        ReadMoreText(
                          "Bali is an Indonesian island known for its forested volcanic mountains, iconic rice paddies, beaches and coral reefs. The island is home to  beaches and coral reefs.",
                          trimMode: TrimMode.Line,
                          trimLines: 3,
                          colorClickableText: ui4MainColor,
                          style: TextStyle(color: Colors.white70),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.white38,
                    height: 20,
                  ),
                  SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: QText(
                      "Destinations in Bali",
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 16),
                  Container(
                    height: 200,
                    child: ListView.separated(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      scrollDirection: Axis.horizontal,
                      itemCount: places.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Stack(
                            children: [
                              CachedNetworkImage(
                                height: 200,
                                width: 270,
                                fit: BoxFit.cover,
                                imageUrl: '${places[index]["img"]}',
                              ),
                              Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 12),
                                  color: Colors.black54,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      QText(
                                        places[index]["name"],
                                        fontSize: 15,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      QText(
                                        places[index]["loc"],
                                        color: Colors.white.withOpacity(.9),
                                        fontSize: 11,
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(width: 20);
                      },
                    ),
                  ),
                  SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: MainButton(
                      title: "Buy Tickets",
                      onTap: () {},
                      color: ui4MainColor,
                      titleSize: 14,
                      radius: 16,
                    ),
                  ),
                  SizedBox(height: 35),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
