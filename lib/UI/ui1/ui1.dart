import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:ui_challenge/controls/deviceSize.dart';
import 'package:ui_challenge/controls/printString.dart';
import 'package:ui_challenge/supportingWidget/main_button.dart';
import 'package:visibility_detector/visibility_detector.dart';

class UI1 extends StatefulWidget {
  @override
  _UI1State createState() => _UI1State();
}

class _UI1State extends State<UI1> {
  Color _mainColor = Color(0xff52D3C2);
  ScrollController _scrollController = ScrollController();
  double _opacity = 1;
  double visiblePercentage = 0.0;

  List _roomPhotos = [
    "https://images.unsplash.com/photo-1567767292278-a4f21aa2d36e?ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8bGl2aW5nJTIwcm9vbXxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80",
    "https://www.thespruce.com/thmb/mYMBZBGjJOVOk2MMordSK_xfdL0=/4200x2800/filters:no_upscale():max_bytes(150000):strip_icc()/8X4A6310_Spruce_49684-25d4f0475c57458b9bf96f9af4b4ea71.jpg",
    "https://images.unsplash.com/photo-1554995207-c18c203602cb?ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8bGl2aW5nJTIwcm9vbXxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80",
    "https://media.istockphoto.com/photos/hotel-room-suite-with-view-picture-id627892060?k=20&m=627892060&s=612x612&w=0&h=k6QY-qWNlFbvYhas82e_MoSXceozjrhhgp-krujsoDw=",
    "https://www.thespruce.com/thmb/Hc8H02ZiKRILI_0vAQe8GBKP1bo=/2075x1383/filters:fill(auto,1)/living-room-dos-and-donts-2213467-hero-da82a4643bc84d669a0a34f64e60beb1.jpg",
    "https://upload.wikimedia.org/wikipedia/commons/thumb/8/83/Imperial_Hotel_Osaka_regular_floor_standard_twin_room_20120630-001.jpg/1200px-Imperial_Hotel_Osaka_regular_floor_standard_twin_room_20120630-001.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                ///image
                Stack(
                  children: [
                    ///image
                    CachedNetworkImage(
                      height: deviceHeight(context),
                      width: deviceWidth(context),
                      imageUrl:
                          "https://i.pinimg.com/originals/37/d0/ce/37d0ced0d0e02cd74469e28a2555f52d.jpg",
                      fit: BoxFit.cover,
                    ),

                    ///basic details
                    Positioned(
                      bottom: 50,
                      left: 20,
                      right: 20,
                      child: VisibilityDetector(
                        key: Key("myKey"),
                        onVisibilityChanged: (VisibilityInfo info) {
                          visiblePercentage = info.visibleFraction * 100;
                          setState(() {});
                          if (visiblePercentage < 85) {
                            if (_opacity == 1) {
                              setState(() {
                                _opacity = 0;
                              });
                            }
                          } else {
                            if (_opacity == 0) {
                              setState(() {
                                _opacity = 1;
                              });
                            }
                          }
                        },
                        child: AnimatedOpacity(
                          duration: Duration(seconds: 1),
                          opacity: _opacity,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 16,
                            ),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.grey.withOpacity(.9),
                                  Colors.grey.withOpacity(1),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Grand Royal\nPark Hotel",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize:
                                                  deviceWidth(context) * .07,
                                              color: Colors.white,
                                            ),
                                          ),
                                          SizedBox(height: 6),
                                          Row(
                                            children: [
                                              Text(
                                                "Wambley, London",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 13,
                                                ),
                                              ),
                                              SizedBox(width: 6),
                                              Icon(
                                                Icons.location_on,
                                                color: _mainColor,
                                                size: 16,
                                              ),
                                              Text(
                                                " 2 km to city",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 13,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 5),
                                          Row(
                                            children: [
                                              for (int i = 0; i < 5; i++)
                                                Icon(
                                                  i == 4
                                                      ? Icons.star_rate_outlined
                                                      : Icons.star_rate,
                                                  color: _mainColor,
                                                  size: 16,
                                                ),
                                              SizedBox(width: 6),
                                              Text(
                                                "80 Reviews",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 13,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          "\$380",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize:
                                                deviceWidth(context) * .06,
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(height: 4),
                                        Text(
                                          "/per night",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w300,
                                            fontSize: 14,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),

                                SizedBox(height: 16),

                                ///
                                MainButton(
                                  title: "Book now",
                                  onTap: () {},
                                  radius: 30,
                                  height: 50,
                                  color: _mainColor,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                    ///more button
                    Positioned(
                      bottom: 0,
                      right: 0,
                      left: 0,
                      child: InkWell(
                        onTap: () {
                          if (visiblePercentage < 85) {
                            _scrollController.animateTo(0,
                                duration: Duration(seconds: 1),
                                curve: Curves.easeInOutSine);
                          } else {
                            setState(() {
                              _opacity = 0;
                            });
                            _scrollController.animateTo(
                                deviceHeight(context) * .8,
                                duration: Duration(seconds: 1),
                                curve: Curves.easeInOutSine);
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                visiblePercentage < 85
                                    ? "Hide details"
                                    : "More details",
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(width: 4),
                              Icon(
                                visiblePercentage < 85
                                    ? Icons.expand_less_rounded
                                    : Icons.expand_more,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                ///detail section
                Container(
                  height: deviceHeight(context) * .8,
                  width: deviceWidth(context),
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 14, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ///
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Grand Royal\nPark Hotel",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: deviceWidth(context) * .08,
                                    ),
                                  ),
                                  SizedBox(height: 6),
                                  Row(
                                    children: [
                                      Text(
                                        "Wambley, London",
                                        style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 13,
                                        ),
                                      ),
                                      SizedBox(width: 6),
                                      Icon(
                                        Icons.location_on,
                                        color: _mainColor,
                                        size: 16,
                                      ),
                                      Text(
                                        " 2 km to city",
                                        style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "\$380",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: deviceWidth(context) * .06,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  "/per night",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 14,
                                    color: Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),

                        Divider(height: 40, thickness: 1.5),

                        ///summery
                        Text(
                          "Summary",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 17,
                            color: Colors.black54,
                          ),
                        ),
                        SizedBox(height: 10),
                        ReadMoreText(
                          "Room configurations are unique physical layouts that may be scheduled for a given room. A room has a default configuration (required) and any number of other possible configurations. ... Rooms with multiple configurations are most commonly used for event scheduling.",
                          trimLines: 3,
                          trimMode: TrimMode.Line,
                          colorClickableText: _mainColor,
                          style: TextStyle(color: Colors.black, height: 1.35),
                        ),

                        SizedBox(height: 20),

                        ///
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 18,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(.04),
                                blurRadius: 6,
                                offset: Offset(1, 2),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "4.5",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: deviceWidth(context) * .11,
                                      color: _mainColor,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Overall Rating",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15,
                                          ),
                                        ),
                                        SizedBox(height: 2),
                                        Row(
                                          children: [
                                            for (int i = 0; i < 5; i++)
                                              Icon(
                                                i == 4
                                                    ? Icons.star_rate_outlined
                                                    : Icons.star_rate,
                                                color: _mainColor,
                                                size: 15,
                                              ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              _rowRating("room", 1),
                              SizedBox(height: 10),
                              _rowRating("Service", .6),
                              SizedBox(height: 10),
                              _rowRating("Location", .8),
                              SizedBox(height: 10),
                              _rowRating("Price", .9),
                            ],
                          ),
                        ),

                        SizedBox(height: 30),

                        ///photos
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Photos",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 17,
                                color: Colors.black54,
                              ),
                            ),
                            Text(
                              "View All",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 17,
                                color: _mainColor,
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 16),

                        Container(
                          height: 150,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: _roomPhotos.length,
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: CachedNetworkImage(
                                  height: 150,
                                  width: 200,
                                  fit: BoxFit.cover,
                                  imageUrl: _roomPhotos[index],
                                ),
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return SizedBox(width: 16);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),

          ///appbar
          Container(
            height: 90,
            child: AppBar(
              backgroundColor: Colors.black.withOpacity(.05),
              elevation: 0,
              actions: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 17,
                  child: Icon(
                    Icons.favorite_border_outlined,
                    color: _mainColor,
                    size: 17,
                  ),
                ),
                SizedBox(width: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _rowRating(String title, double progress) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Text(
            title,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          flex: 10,
          child: Align(
            alignment: Alignment.centerLeft,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Container(
                height: 6,
                width: progress * deviceWidth(context) * .65,
                child: LinearProgressIndicator(
                  value: 1,
                  valueColor: AlwaysStoppedAnimation<Color>(_mainColor),
                  backgroundColor: Colors.transparent,
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 20),
      ],
    );
  }
}
