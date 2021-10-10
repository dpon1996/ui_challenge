import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ui_challenge/UI/ui2/ui2.dart';
import 'package:ui_challenge/controls/deviceSize.dart';
import 'package:ui_challenge/supportingWidget/main_button.dart';

class Ui2PlaceDetails extends StatefulWidget {
  @override
  _Ui2PlaceDetailsState createState() => _Ui2PlaceDetailsState();
}

class _Ui2PlaceDetailsState extends State<Ui2PlaceDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
        decoration: BoxDecoration(
          color: ui2MainColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Average cost",
                    style: TextStyle(color: Colors.white70),
                  ),
                  SizedBox(height: 6),
                  Text(
                    "260\$",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 22,
                    ),
                  ),
                ],
              ),
            ),
            MainButton(
              title: "Book a Tour",
              titleColor: ui2MainColor,
              titleSize: 12,
              onTap: () {},
              color: Colors.white,
              width: null,
              height: 40,
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///image
            Stack(
              clipBehavior: Clip.none,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                  child: CachedNetworkImage(
                    height: 400,
                    fit: BoxFit.cover,
                    imageUrl:
                        "https://youmatter.world/app/uploads/sites/2/2019/11/travel-world.jpg",
                  ),
                ),
                Positioned(
                  bottom: -22.5,
                  right: 40,
                  child: Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            blurRadius: 8,
                            offset: Offset(2, 2)),
                      ],
                    ),
                    child: Icon(
                      Icons.favorite,
                      color: ui2MainColor,
                      size: 22,
                    ),
                  ),
                )
              ],
            ),

            SizedBox(height: 30),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      _rowText("5-7 days", Iconsax.calendar),
                      SizedBox(width: 4),
                      _rowText("20 km", Iconsax.location),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Traveling Today And Tomorrow",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: deviceWidth(context) * .05,
                      height: 1.4,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    "Adventure travel is a type of niche tourism, involving exploration or travel with a certain degree of risk",
                    style: TextStyle(
                        color: Colors.black.withOpacity(.5),
                        height: 1.4,
                        fontSize: 13),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Traveler's Gallery",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: deviceWidth(context) * .05,
                      height: 1.4,
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: CachedNetworkImage(
                            height: 200,
                            width: deviceWidth(context) * .4,
                            fit: BoxFit.cover,
                            imageUrl:
                                "https://funtravellers.com/wp-content/uploads/2019/07/adventure-boardwalk-branch-238631.jpg"),
                      ),
                      Spacer(),
                      Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: CachedNetworkImage(
                                height: 95,
                                width: deviceWidth(context) * .47,
                                fit: BoxFit.cover,
                                imageUrl:
                                    "https://destination-review.com/wp-content/uploads/2020/09/rafting-1200x600.jpg"),
                          ),
                          SizedBox(height: 10),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Stack(
                              children: [
                                CachedNetworkImage(
                                  height: 95,
                                  width: deviceWidth(context) * .47,
                                  fit: BoxFit.cover,
                                  imageUrl:
                                      "https://www.hospitalitynet.org/picture/153118046.jpg",
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  height: 95,
                                  width: deviceWidth(context) * .47,
                                  color: Colors.black38,
                                  child: Text(
                                    "+80 more",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _rowText(String title, IconData icon) {
    return Row(
      children: [
        Icon(icon, color: Colors.black, size: 16),
        SizedBox(width: 4),
        Text(
          title,
          style: TextStyle(color: Colors.black, fontSize: 12),
        )
      ],
    );
  }
}
