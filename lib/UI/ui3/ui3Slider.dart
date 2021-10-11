import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:ui_challenge/UI/ui3/ui3.dart';
import 'package:ui_challenge/UI/ui3/ui3Search.dart';
import 'package:ui_challenge/controls/deviceSize.dart';
import 'package:ui_challenge/controls/navigationHelper.dart';
import 'package:ui_challenge/supportingWidget/main_button.dart';

class Ui3Slider extends StatefulWidget {
  @override
  _Ui3SliderState createState() => _Ui3SliderState();
}

class _Ui3SliderState extends State<Ui3Slider> {
  List _images = [
    "https://www.theblondeabroad.com/wp-content/uploads/2021/09/alex-azabache-b5a_p1JWHX8-unsplash.jpg",
    "https://www.theblondeabroad.com/wp-content/uploads/2021/09/shutterstock_1310009605.jpg",
    "https://64.media.tumblr.com/20c50dc4439b7ad4c3c6cf384d4c03d2/tumblr_ovr9enhJxs1t1cy7no1_1280.jpg",
  ];
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider.builder(
          itemCount: _images.length,
          itemBuilder: (BuildContext context, int index, int realIndex) {
            return CachedNetworkImage(
              width: double.infinity,
              imageUrl: _images[index],
              fit: BoxFit.cover,
            );
          },
          options: CarouselOptions(
              height: deviceHeight(context) * .6,
              viewportFraction: 1,
              autoPlay: true,
              onPageChanged: (val, _) {
                setState(() {
                  index = val;
                });
              }),
        ),
        Positioned(
          left: 0,
          right: 0,
          top: 0,
          bottom: 0,
          child: IgnorePointer(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0),
                    Colors.black.withOpacity(.1),
                    Colors.black.withOpacity(.2),
                    Colors.black.withOpacity(.4),
                    Colors.black.withOpacity(.7),
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 25,
          left: 20,
          right: 20,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Cape Town",
                      style: TextStyle(
                          fontSize: deviceWidth(context) * .09,
                          color: Colors.white,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Extraordinary five-star\noutdoor activities",
                      style: TextStyle(
                        fontSize: deviceWidth(context) * .04,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 10),
                    MainButton(
                      radius: 30,
                      width: 120,
                      height: 35,
                      titleSize: 12,
                      fontWeight: FontWeight.w500,
                      title: "View Hotel",
                      color: ui3MainColor,
                      onTap: () {},
                    )
                  ],
                ),
              ),
              SizedBox(width: 8),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Row(
                  children: List.generate(
                    _images.length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: CircleAvatar(
                        radius: 4,
                        backgroundColor:
                            index == this.index ? ui3MainColor : Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        ///search
        Positioned(
          top: 60,
          left: 20,
          right: 20,
          child: InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) {
                  return Ui3Search();
                },
              );
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.search,
                    color: ui3MainColor,
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      "Where are you going?",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
