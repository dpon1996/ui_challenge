import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ui_challenge/UI/ui5/ui5.dart';
import 'package:ui_challenge/controls/deviceSize.dart';
import 'package:ui_challenge/supportingWidget/Qtext.dart';
import 'package:ui_challenge/supportingWidget/main_button.dart';

class Ui5PlaceDetails extends StatefulWidget {
  final Map data;

  const Ui5PlaceDetails({Key? key, required this.data}) : super(key: key);

  @override
  _Ui5PlaceDetailsState createState() => _Ui5PlaceDetailsState();
}

class _Ui5PlaceDetailsState extends State<Ui5PlaceDetails> {
  List _imageList = [
    "https://globalgrasshopper.com/wp-content/uploads/2020/03/most-beautiful-places-to-visit-in-Japan-1000x667.jpg",
    "https://www.wanderluststorytellers.com/wp-content/uploads/2017/10/Most-Beautiful-Places-in-Switzerland.jpg",
    "https://worldtechinfoz.com/wp-content/uploads/sites/5973/2021/05/asia-vietnam-halong-bay-rocks-nature-boats-xlarge.jpg",

  ];
  late String selectedImage = widget.data["img"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Column(
                children: [
                  ///image

                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Stack(
                      children: [
                        CachedNetworkImage(
                          height: deviceHeight(context) * .53,
                          fit: BoxFit.cover,
                          imageUrl: selectedImage,
                        ),
                        Positioned(
                          top: 0,
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(color: Colors.black.withOpacity(.2)),
                        ),
                        Positioned(
                          bottom: 25,
                          left: 20,
                          right: 150,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              QText(
                                widget.data["name"],
                                fontSize: 30,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                height: 1.2,
                              ),
                              QText(
                                widget.data["loc"],
                                fontSize: 30,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                height: 1,
                              ),
                              SizedBox(height: 20),
                              Row(
                                children: [
                                  QText(
                                    widget.data["price"],
                                    fontSize: 25,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    height: 1,
                                  ),
                                  QText(
                                    "/person",
                                    fontSize: 12,
                                    color: Colors.white,
                                    height: 1,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 20,
                          right: 20,
                          child: Container(
                            width: 50,
                            child: ListView.separated(
                              shrinkWrap: true,
                              itemCount: _imageList.length,
                              itemBuilder: (BuildContext context, int index) {
                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectedImage = _imageList[index];
                                    });
                                  },
                                  child: Stack(
                                    children: [
                                      GlassContainer(
                                        height: 50,
                                        width: 50,
                                        blur: 20,
                                        child: Center(
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            child: CachedNetworkImage(
                                              height: 40,
                                              width: 40,
                                              fit: BoxFit.cover,
                                              imageUrl: _imageList[index],
                                            ),
                                          ),
                                        ),
                                      ),
                                      if (index == 2)
                                        Positioned(
                                          top: 0,
                                          right: 0,
                                          left: 0,
                                          bottom: 0,
                                          child: Container(
                                            color: Colors.black38,
                                            child: Center(
                                              child: QText(
                                                "+10",
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                );
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return SizedBox(height: 6);
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ),

                  SizedBox(height: 25),

                  ///
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      QText(
                        "Overview",
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: ui5MainColor,
                      ),
                      SizedBox(width: 16),
                      QText(
                        "Reviews",
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey.shade400,
                      ),
                    ],
                  ),
                  SizedBox(height: 16),

                  Row(
                    children: [
                      _rowWidget(Iconsax.clock5, "Duration", "5 Hour"),
                      SizedBox(width: 30),
                      _rowWidget(Iconsax.star1, "Rating", "4.5 out of 5"),
                    ],
                  ),

                  SizedBox(height: 20),

                  QText(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                    color: Colors.black54,
                    height: 1.4,
                  )
                ],
              ),
            ),

            ///
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 130,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                      Colors.white.withOpacity(.3),
                      Colors.white.withOpacity(.9),
                      Colors.white,
                    ])),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal:20),
                    child: MainButton(
                      onTap: () {},
                      height: 70,
                      title: "",
                      radius: 20,
                      color: Colors.black,
                      child: Row(
                        children: [
                          Expanded(
                            child: QText(
                              "Book now",
                              color: Colors.white,
                              textAlign: TextAlign.center,
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Icon(
                            Icons.keyboard_arrow_right_outlined,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _rowWidget(IconData icon, String title, String data) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: Container(
            height: 40,
            width: 40,
            color: Colors.grey.shade200,
            child: Icon(
              icon,
              color: ui5MainColor,
              size: 25,
            ),
          ),
        ),
        SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            QText(
              title.toUpperCase(),
              fontSize: 11,
              color: Colors.grey,
              fontWeight: FontWeight.w500,
            ),
            QText(
              data,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ],
        ),
      ],
    );
  }
}
