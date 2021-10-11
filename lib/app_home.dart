import 'package:flutter/material.dart';
import 'package:ui_challenge/UI/ui1/ui1.dart';
import 'package:ui_challenge/UI/ui2/ui2.dart';
import 'package:ui_challenge/UI/ui3/ui3.dart';
import 'package:ui_challenge/controls/navigationHelper.dart';
import 'package:ui_challenge/supportingWidget/main_button.dart';

class AppHome extends StatefulWidget {
  const AppHome({Key? key}) : super(key: key);

  @override
  _AppHomeState createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("APP HOME PAGE"),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
        children: [
          ///ui 1
          MainButton(
            title: "UI 1",
            onTap: () {
              push(context, UI1());
            },
          ),

          SizedBox(height: 16),
          ///ui 2
          MainButton(
            title: "UI 2",
            onTap: () {
              push(context, UI2());
            },
          ),

          SizedBox(height: 16),
          ///ui 3
          MainButton(
            title: "UI 3",
            onTap: () {
              push(context, UI3());
            },
          ),

        ],
      ),
    );
  }
}
