import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ui_challenge/UI/ui2/ui2.dart';
import 'package:ui_challenge/UI/ui2/ui2PlaceDetails.dart';
import 'package:ui_challenge/controls/deviceSize.dart';
import 'package:ui_challenge/controls/navigationHelper.dart';

class Ui2Home extends StatefulWidget {
  @override
  _Ui2HomeState createState() => _Ui2HomeState();
}

class _Ui2HomeState extends State<Ui2Home> {
  List _category = [
    {
      "title": "Accomodation",
      "image":
          "https://cdn0.iconfinder.com/data/icons/hotel-service-7/64/room-available-vacancy-hotel-accommodation-512.png",
    },
    {
      "title": "Experience",
      "image": "http://cdn.onlinewebfonts.com/svg/img_562669.png",
    },
    {
      "title": "Adventure",
      "image":
          "https://www.freeiconspng.com/thumbs/compass-icon/compass-icon-1.png",
    },
    {
      "title": "Flights",
      "image":
          "https://www.freeiconspng.com/thumbs/airplane-icon-png/plane-icon-png-images--pictures--becuo-8.png",
    },
  ];

  List _placeList = [
    {
      "img":
          "https://www.usnews.com/dims4/USNEWS/2c8fa9b/2147483647/thumbnail/640x420/quality/85/?url=http%3A%2F%2Fmedia.beam.usnews.com%2F73%2F5b%2F7046cec142609163ea236f0ed930%2F161006-perusoftadventure-stock.jpg",
      "name":
          "10 Outside-the-Box Experiential Travel Gift Ideas | En Route | US News",
    },
    {
      "img":
          "https://youmatter.world/app/uploads/sites/2/2019/11/travel-world.jpg",
      "name":
          "Traveling Today And Tomorrow: Cities And Countries With More Travelers",
    },
    {
      "img":
          "https://blog-assets.thedyrt.com/uploads/2019/06/shutterstock_1025028400-1.jpg",
      "name": "Eco tourism 101: What It Is and How Campers Can Participate",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: false,
        showSelectedLabels: false,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: ui2MainColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 27,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, size: 27),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border_outlined, size: 25),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.user, size: 23),
            label: "",
          ),
        ],
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Icon(Icons.drag_handle),
        actions: [
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(7),
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl:
                    "https://organicthemes.com/demo/profile/files/2018/05/profile-pic.jpg",
                height: 40,
                width: 40,
              ),
            ),
          ),
          SizedBox(width: 10),
        ],
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///text
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: RichText(
                text: TextSpan(
                  text: "Hello",
                  style: TextStyle(
                      color: ui2MainColor,
                      fontWeight: FontWeight.w600,
                      fontSize: deviceWidth(context) * .07,
                      height: 1.4),
                  children: [
                    TextSpan(
                      text: ", what are you looking for?",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 40),

            ///category
            Container(
              height: 100,
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 20),
                scrollDirection: Axis.horizontal,
                itemCount: _category.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      ///image
                      Container(
                        height: 65,
                        width: 65,
                        decoration: BoxDecoration(
                          color: ui2MainColor.withOpacity(.15),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Center(
                          child: CachedNetworkImage(
                            height: 32,
                            width: 32,
                            imageUrl: _category[index]["image"],
                            color: ui2MainColor,
                          ),
                        ),
                      ),
                      SizedBox(height: 8),

                      ///title
                      Text(
                        _category[index]["title"],
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(width: 20);
                },
              ),
            ),

            SizedBox(height: 25),

            ///
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "Best Experience",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: deviceWidth(context) * .05),
                    ),
                  ),
                  Icon(Icons.more_horiz)
                ],
              ),
            ),
            SizedBox(height: 16),

            ///category
            Container(
              height: 300,
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 20),
                scrollDirection: Axis.horizontal,
                itemCount: _placeList.length,
                itemBuilder: (BuildContext context, int index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: InkWell(
                      onTap: (){
                        push(context, Ui2PlaceDetails());
                      },
                      child: Stack(
                        children: [
                          CachedNetworkImage(
                            fit: BoxFit.cover,
                            width: 230,
                            height: 300,
                            imageUrl: _placeList[index]["img"],
                          ),
                          Positioned(
                            right: 12,
                            top: 12,
                            child: Icon(
                              Icons.favorite,
                              color:index == 0 ? ui2MainColor : Colors.white,
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              padding: EdgeInsets.only(
                                  left: 8, right: 8, bottom: 35, top: 25),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.black.withOpacity(0),
                                    Colors.black.withOpacity(.9),
                                  ],
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    _placeList[index]["name"],
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: deviceWidth(context) * .05,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(height: 16),
                                  Row(
                                    children: [
                                      _rowText("5-7 days", Iconsax.calendar),
                                      SizedBox(width: 4),
                                      _rowText("20 km", Iconsax.location),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(width: 16);
                },
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
        Icon(icon, color: Colors.white70, size: 16),
        SizedBox(width: 4),
        Text(
          title,
          style: TextStyle(color: Colors.white70, fontSize: 12),
        )
      ],
    );
  }
}
