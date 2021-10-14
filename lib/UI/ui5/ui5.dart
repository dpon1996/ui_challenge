import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ui_challenge/UI/ui5/ui5PlaseDetails.dart';
import 'package:ui_challenge/controls/deviceSize.dart';
import 'package:ui_challenge/controls/navigationHelper.dart';
import 'package:ui_challenge/supportingWidget/Qtext.dart';

class UI5 extends StatefulWidget {
  @override
  _UI5State createState() => _UI5State();
}

Color ui5MainColor = Color(0xffFF743F);

class _UI5State extends State<UI5> {
  List _category = [
    {
      "img":
          "https://www.pinclipart.com/picdir/big/488-4886415_camping-transparent-background-png-camping-tent-vector-png.png",
      "name": "camp",
    },
    {
      "img":
          "https://creazilla-store.fra1.digitaloceanspaces.com/cliparts/63909/mountain-clipart-xl.png",
      "name": "Mountains",
    },
    {
      "img":
          "https://creazilla-store.fra1.digitaloceanspaces.com/cliparts/10711/trees-forest-bird-clipart-xl.png",
      "name": "Forest",
    },
  ];

  List _places = [
    {
      "img":
          "https://worldtechinfoz.com/wp-content/uploads/sites/5973/2021/05/asia-vietnam-halong-bay-rocks-nature-boats-xlarge.jpg",
      "price": "\$50",
      "name": "Hokkaido",
      "loc": "camp ",
    },
    {
      "img":
          "https://globalgrasshopper.com/wp-content/uploads/2020/03/most-beautiful-places-to-visit-in-Japan-1000x667.jpg",
      "price": "\$60",
      "name": "Tokyo",
      "loc": "Japan",
    },
    {
      "img":
          "https://www.wanderluststorytellers.com/wp-content/uploads/2017/10/Most-Beautiful-Places-in-Switzerland.jpg",
      "price": "\$55",
      "name": "Kamakura",
      "loc": "Japan",
    }
  ];

  List _icon = [
    Icons.home_filled,
    Icons.margin,
    Icons.favorite_border_outlined,
    Iconsax.user,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        centerTitle: false,
        elevation: 0,
        leading: Align(
          alignment: Alignment.centerRight,
          child: CircleAvatar(
            radius: 18,
            backgroundColor: Colors.grey.shade200,
            backgroundImage: CachedNetworkImageProvider(
                "https://www.pngitem.com/pimgs/m/78-786293_1240-x-1240-0-avatar-profile-icon-png.png"),
          ),
        ),
        title: QText(
          "Hi, Dhanesh",
          color: CupertinoColors.black,
        ),
        actions: [
          Container(
            height: 32,
            width: 32,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              boxShadow: [
                BoxShadow(color: ui5MainColor.withOpacity(.4), blurRadius: 3)
              ],
            ),
            child: Icon(
              Iconsax.notification,
              color: ui5MainColor,
              size: 15,
            ),
          ),
          SizedBox(width: 20)
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
        child: Container(
          height: 80,
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
          decoration: BoxDecoration(
              color: Colors.black, borderRadius: BorderRadius.circular(22)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              4,
              (index) => Container(
                width: 45,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: index == 0
                      ? RadialGradient(
                          center: Alignment.topCenter,
                          radius: 2.9,
                          colors: [
                            ui5MainColor.withOpacity(.1),
                            ui5MainColor.withOpacity(1),
                            ui5MainColor.withOpacity(1),
                          ],
                        )
                      : null,
                ),
                child: Icon(
                  _icon[index],
                  color: Colors.white,
                  size: 29,
                ),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  QText(
                    "Where do\nyou want to go?",
                    fontSize: deviceWidth(context) * .067,
                    height: 1.25,
                    fontWeight: FontWeight.w700,
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(.09),
                          blurRadius: 3,
                          offset: Offset(1, 1),
                        ),
                      ],
                    ),
                    child: ListTile(
                      dense: true,
                      visualDensity: VisualDensity.comfortable,
                      title: QText(
                        "Search for places...",
                        color: Colors.grey.shade400,
                      ),
                      trailing: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: ui5MainColor.withOpacity(.4),
                                blurRadius: 3)
                          ],
                        ),
                        child: Icon(
                          Iconsax.search_normal,
                          color: ui5MainColor,
                          size: 12,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  QText(
                    "Categories",
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
            Container(
              height: 60,
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 20),
                itemCount: _category.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding: EdgeInsets.all(6),
                    margin: EdgeInsets.only(bottom: 6),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(.09),
                            blurRadius: 4,
                            offset: Offset(1, 1),
                          )
                        ]),
                    child: Row(
                      children: [
                        Container(
                          height: 40,
                          width: 45,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: CachedNetworkImage(
                            imageUrl: _category[index]["img"],
                            height: 35,
                            width: 35,
                          ),
                        ),
                        SizedBox(width: 16),
                        QText(_category[index]["name"]),
                        SizedBox(width: 20),
                      ],
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(width: 10);
                },
              ),
            ),
            SizedBox(height: 25),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: QText(
                      "Top trips",
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  QText(
                    "Explore",
                    fontSize: 13,
                    color: Colors.black54,
                  ),
                  Icon(
                    Icons.keyboard_arrow_right_outlined,
                    size: 16,
                    color: ui5MainColor,
                  )
                ],
              ),
            ),
            SizedBox(height: 12),
            Container(
              height: 210,
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 20),
                itemCount: _places.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      push(
                        context,
                        Ui5PlaceDetails(
                          data: _places[index],
                        ),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(8),
                      margin: EdgeInsets.only(bottom: 6),
                      width: 160,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(.09),
                            blurRadius: 4,
                            offset: Offset(1, 1),
                          )
                        ],
                      ),
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: CachedNetworkImage(
                                  width: 160,
                                  height: 130,
                                  fit: BoxFit.cover,
                                  imageUrl: _places[index]["img"],
                                ),
                              ),
                              Positioned(
                                right: 12,
                                top: 12,
                                child: Container(
                                  height: 27,
                                  padding: EdgeInsets.symmetric(horizontal: 18),
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade300.withOpacity(.7),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Center(
                                    child: QText(
                                      _places[index]["price"],
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              SizedBox(width: 4),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    QText(
                                      _places[index]["name"],
                                      fontWeight: FontWeight.w700,
                                    ),
                                    QText(
                                      _places[index]["loc"],
                                      height: 1.3,
                                      fontSize: 13,
                                      color: Colors.black54,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: ui5MainColor.withOpacity(.25),
                                        blurRadius: 4,
                                        offset: Offset(0, 2))
                                  ],
                                ),
                                child: Icon(
                                  Iconsax.search_normal,
                                  color: ui5MainColor,
                                  size: 12,
                                ),
                              ),
                              SizedBox(width: 8),
                            ],
                          ),
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
}
