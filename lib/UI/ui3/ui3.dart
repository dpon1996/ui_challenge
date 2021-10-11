import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ui_challenge/UI/ui3/ui3Slider.dart';

class UI3 extends StatefulWidget {
  @override
  _UI3State createState() => _UI3State();
}

Color ui3MainColor = Color(0xff55D2C2);

class _UI3State extends State<UI3> {
  @override
  Widget build(BuildContext context) {
    List place = [
      {
        "img":
            "https://media.tacdn.com/media/attractions-splice-spp-674x446/09/93/6a/89.jpg",
        "name": "London",
      },
      {
        "img":
            "https://a.cdn-hotels.com/cos/heroimage/Paris_0_108362288.jpg?impolicy=fcrop&w=536&h=384&q=high",
        "name": "Paris",
      },
      {
        "img":
            "https://static.onecms.io/wp-content/uploads/sites/28/2021/02/19/new-york-city-evening-NYCTG0221.jpg",
        "name": "New York",
      },
      {
        "img":
            "https://www.skylinehousing.net/wp-content/uploads/2018/09/destination-tokyo-01-1280x854.jpg",
        "name": "Tokyo",
      },
    ];
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: ui3MainColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
            ),
            label: "Explore",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border_outlined, size: 22),
            label: "Tips",
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.user, size: 20),
            label: "Profile",
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Ui3Slider(),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Popular Destinations",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                ),
              ),
            ),
            SizedBox(height: 16),
            Container(
              height: 190,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: place.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Stack(
                      children: [
                        CachedNetworkImage(
                          width: 270,
                          height: 190,
                          fit: BoxFit.cover,
                          imageUrl: place[index]["img"],
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
                                  begin: Alignment.bottomRight,
                                  end: Alignment.topLeft,
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
                          top: 12,
                          left: 10,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                place[index]["name"],
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                "1 Room - 2 Adults",
                                style: TextStyle(
                                    color: Colors.white.withOpacity(.8),
                                    fontSize: 11
                                ),
                              ),
                              SizedBox(height: 2),
                              Text(
                                "12 - 22 Dec",
                                style: TextStyle(
                                    color: Colors.white.withOpacity(.8),
                                    fontSize: 11
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(width: 10);
                },
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
