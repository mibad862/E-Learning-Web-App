import 'package:flutter/material.dart';

class WebAppBar extends StatefulWidget {
  const WebAppBar({super.key});

  @override
  State<WebAppBar> createState() => _WebAppBarState();
}

class _WebAppBarState extends State<WebAppBar> {
  bool _isHovered1 = false;
  bool _isHovered2 = false;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      clipBehavior: Clip.none,
      backgroundColor: Colors.black,
      toolbarHeight: 72.0,
      title: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('MaclayAcademy', style: TextStyle(color: Colors.white)),
          const SizedBox(
            width: 32.0,
          ),
          Spacer(),
          Stack(
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
                    icon: Icon(
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
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600)),
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
          Stack(
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
              if(_isHovered2)
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
          // PopupMenuButton(
          //   icon: Icon(
          //     Icons.notifications_none_outlined,
          //     color: Colors.white,
          //     size: 25,
          //   ),
          //   position: PopupMenuPosition.under,
          //   itemBuilder: (context) => [
          //     PopupMenuItem(
          //       child: Text("Ebad"),
          //     ),
          //     PopupMenuItem(
          //       child: Text("Ali"),
          //     ),
          //     PopupMenuItem(
          //       child: Text("Noman"),
          //     )
          //   ],
          // ),
        ],
      ),

    );
  }
}
