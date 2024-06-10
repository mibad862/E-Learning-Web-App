import 'package:flutter/material.dart';
import '../widgets/common_dropdown_button.dart';
import '../widgets/mobile_app_bar.dart';
import '../widgets/web_app_bar.dart';
import 'break-points.dart';
import 'screen_one.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          backgroundColor: Colors.black,
          appBar: constraints.maxWidth < mobileBreakPoint
              ? PreferredSize(
                  preferredSize: Size(double.infinity, 55.0),
                  child: MobileAppBar(),
                )
              : PreferredSize(
                  preferredSize: Size(double.infinity, 72.0),
                  child: WebAppBar(),
                ),
          drawer: constraints.maxWidth < mobileBreakPoint ? Drawer() : null,
          body: Align(
            alignment: Alignment.center,
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 1400),
              child: ListView(
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
