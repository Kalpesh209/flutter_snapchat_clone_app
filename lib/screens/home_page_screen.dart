import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_snapchat_clone_app/common/colors.dart';
import 'package:flutter_snapchat_clone_app/screens/camera_screen.dart';
import 'package:flutter_snapchat_clone_app/screens/chat_screen.dart';
import 'package:flutter_snapchat_clone_app/screens/discovery_screen.dart';
import 'package:flutter_snapchat_clone_app/screens/map_screen.dart';
import 'package:flutter_snapchat_clone_app/screens/stories_screen.dart';

class HomePageScreen extends StatefulWidget {
  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<HomePageScreen> {
  int pageIndex = 0;
  List<Widget> pages = [
    MapScreen(),
    ChatScreen(),
    CameraScreen(),
    StoriesScreen(),
    DiscoverScreen()
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
      bottomNavigationBar: getFooter(),
    );
  }

  Widget getBody() {
    // return pages.elementAt(pageIndex);
    return IndexedStack(
      index: pageIndex,
      children: pages,
    );
  }

  Widget getFooter() {
    List iconItems = [
      Feather.map_pin,
      MaterialIcons.chat_bubble_outline,
      Feather.camera,
      Feather.users,
      Feather.menu
    ];
    List textItems = ["Map", "Chat", "Camera", "Stories", "Discover"];
    List colorItems = [
      green,
      blue,
      primary,
      purple,
      primary,
    ];
    return Container(
      width: double.infinity,
      height: 90,
      decoration: BoxDecoration(
          color: Colors.black,
          border: Border(
              top:
                  BorderSide(width: 2, color: Colors.black.withOpacity(0.06)))),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(textItems.length, (index) {
            return InkWell(
                onTap: () {
                  selectedTab(index);
                },
                child: Column(
                  children: [
                    Icon(iconItems[index],
                        color: pageIndex == index
                            ? colorItems[index]
                            : Colors.white.withOpacity(0.5)),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      textItems[index],
                      style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                          color: pageIndex == index
                              ? Colors.white
                              : Colors.white.withOpacity(0.5)),
                    )
                  ],
                ));
          }),
        ),
      ),
    );
  }

  selectedTab(index) {
    setState(() {
      pageIndex = index;
    });
  }
}
