import 'package:flutter/material.dart';
import '../widgets/common_dropdown_button.dart';
import '../widgets/mobile_app_bar.dart';
import '../widgets/web_app_bar.dart';
import 'break-points.dart';
import 'screen_one.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  bool _isHovered1 = false;
  bool _isHovered2 = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          backgroundColor: Colors.black,
          appBar: constraints.maxWidth < mobileBreakPoint
              ? const PreferredSize(
                  preferredSize: Size(double.infinity, 55.0),
                  child: MobileAppBar(),
                )
              :  PreferredSize(
                  preferredSize: const Size(double.infinity, 72.0),
                  child: WebAppBar(
                    stack1: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: MouseRegion(
                            cursor: SystemMouseCursors.contextMenu,
                            onEnter: (_) => setState(() {
                              _isHovered1 = true;
                            }),
                            onExit: (_) => setState(() {
                              _isHovered1 = false;
                            }),
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.notifications_none_outlined,
                                color: Colors.white,
                                size: 25,
                              ),
                            ),
                          ),
                        ),
                        if (_isHovered1)
                          Positioned(
                            top: 55.0,
                            // Adjust this value to position the container below the icon
                            right: 0,
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                              alignment: Alignment.topCenter,
                              height: 120,
                              width: 280,
                              color: Colors.white,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Notifications",
                                          style: TextStyle(
                                              fontSize: 18, fontWeight: FontWeight.w600)),
                                      TextButton(
                                        onPressed: () {},
                                        child: Text("Settings"),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 30),
                                  Text("No notifications.",
                                      style: TextStyle(
                                          fontSize: 16, fontWeight: FontWeight.w400)),
                                ],
                              ),
                            ),
                          ),
                      ],
                    ),
                    stack2: Stack(
                      alignment: Alignment.bottomLeft,
                      clipBehavior: Clip.none,
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: MouseRegion(
                            cursor: SystemMouseCursors.contextMenu,
                            onEnter: (_) => setState(() {
                              _isHovered2 = true;
                            }),
                            onExit: (_) => setState(() {
                              _isHovered2 = false;
                            }),
                            child: Container(
                              alignment: Alignment.center,
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: Text(
                                "ME",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                        if (_isHovered2)
                          Positioned(
                            top: 55,
                            right: 0,
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 5),
                              alignment: Alignment.topCenter,
                              height: 300,
                              width: 220,
                              color: Colors.white,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ListTile(
                                    leading: Container(
                                      alignment: Alignment.center,
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.black,
                                      ),
                                      child: Text(
                                        "ME",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    title: Text(
                                      "Muhammad Ebad",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    subtitle: Text(
                                      "mibad862@gmail.com",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  Divider(),
                                  Padding(
                                    padding: EdgeInsets.only(top: 8, bottom: 8, left: 10),
                                    child: Text(
                                      "Account Settings",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  Divider(),
                                  Padding(
                                    padding: EdgeInsets.only(top: 8, bottom: 8, left: 10),
                                    child: Text(
                                      "Edit Profile",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  Divider(),
                                  Padding(
                                    padding: EdgeInsets.only(top: 8, bottom: 8, left: 10),
                                    child: Text(
                                      "Help",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 8, bottom: 8, left: 10),
                                    child: Text(
                                      "Log out",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
          drawer: constraints.maxWidth < mobileBreakPoint ? Drawer() : null,
          body: Align(
            alignment: Alignment.center,
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 1400),
              child: ListView(
                padding: EdgeInsets.only(top: 30),
                children: <Widget>[
                  const Text(
                    "Courses",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 10),
                            height: 48,
                            width: 250,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white,
                              ),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Expanded(
                                  child: TextField(
                                    style: TextStyle(color: Colors.white),
                                    decoration: InputDecoration(
                                        hintStyle:
                                            TextStyle(color: Colors.white),
                                        hintText: "Search you courses"),
                                  ),
                                ),
                                Container(
                                  height: 46,
                                  width: 46,
                                  color: Colors.white,
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.search,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 25),
                          const CommonDropdownButton(
                            hintText: "Newest",
                            items: [
                              "Newest",
                              "Oldest",
                              "A-Z",
                              "Z-A",
                              "Published first",
                              "Unpublished first"
                            ],
                          ),
                        ],
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ScreenOne(),
                            ),
                          );
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 48,
                          width: 105,
                          color: Colors.white,
                          child: Text("New course"),
                        ),
                      ),
                    ],
                  ),
                  // TopSection(),
                  // AdvantagesSection(),
                  // CoursesSection(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
