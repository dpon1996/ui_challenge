import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ui_challenge/UI/ui3/ui3.dart';
import 'package:ui_challenge/controls/deviceSize.dart';

class Ui3Search extends StatefulWidget {
  @override
  _Ui3SearchState createState() => _Ui3SearchState();
}

class _Ui3SearchState extends State<Ui3Search> {
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

  @override
  Widget build(BuildContext context) {
    return Container(
      height: deviceHeight(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 40),
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.close),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Search",
                    style: TextStyle(
                      fontSize: deviceWidth(context) * .09,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 25),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            blurRadius: 5,
                            offset: Offset(3, 3)),
                      ],
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
                  SizedBox(height: 35),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Last Searches",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Text(
                        "Clear all",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: ui3MainColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  GridView.builder(
                    itemCount: place.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 25,
                      childAspectRatio: .8,
                    ),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(.08),
                              blurRadius: 3,
                              offset: Offset(3, 3),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CachedNetworkImage(
                                height: 140,
                                width: double.infinity,
                                imageUrl: place[index]['img'],
                                fit: BoxFit.cover,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      place[index]["name"],
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      "1 Room - 2 Adults",
                                      style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 11
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      "12 - 22 Dec",
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 11
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
