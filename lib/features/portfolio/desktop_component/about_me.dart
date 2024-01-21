import 'package:flashcoders/features/portfolio/portfolio_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xff1e1e1f),
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
        border: Border.all(
          color: Colors.white.withOpacity(0.1),
        ),
      ),
      child: Stack(
        children: [
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "About me",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  width: 90,
                  child: Divider(
                    color: Colors.orangeAccent,
                    height: 8,
                    thickness: 2,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  """Hi there, I'm Pratap Singh, a driven Flutter developer with more than two years of hands-on expertise creating mobile applications.\n\nMy experience with Flutter has been formed by my constant commitment to producing high-caliber, user-friendly applications. My area of expertise consists of combining cutting-edge technology with a strong design understanding to create visually stunning and functional applications.With a proven track record of delivering high-quality code and intuitive user interfaces, I'm adept at integrating complex functionalities while maintaining code efficiency.""",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  "Skills",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 11,
                      backgroundColor: Colors.white,
                      child: Center(
                        child: Icon(
                          Icons.done_outline_sharp,
                          color: Colors.orange,
                          size: 13,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Text(
                      "Flutter / Dart",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 11,
                      backgroundColor: Colors.white,
                      child: Center(
                        child: Icon(
                          Icons.done_outline_sharp,
                          color: Colors.orange,
                          size: 13,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Text(
                      "Provider, Riverpod",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 11,
                      backgroundColor: Colors.white,
                      child: Center(
                        child: Icon(
                          Icons.done_outline_sharp,
                          color: Colors.orange,
                          size: 13,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Text(
                      "Firebase, Supabase, Serverpod",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 11,
                      backgroundColor: Colors.white,
                      child: Center(
                        child: Icon(
                          Icons.done_outline_sharp,
                          color: Colors.orange,
                          size: 13,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: Text(
                        "Push Notification, In App Purchase, Google Maps Integration, Rest API",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 11,
                      backgroundColor: Colors.white,
                      child: Center(
                        child: Icon(
                          Icons.done_outline_sharp,
                          color: Colors.orange,
                          size: 13,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: Text(
                        "WebRTC",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.topRight,
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xff282829),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Consumer(builder: (context, ref, child) {
                    final selectedMenu =
                        ref.watch(portfolioNotifierProvider).value;
                    final refRead =
                        ref.read(portfolioNotifierProvider.notifier);
                    return Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextButton(
                          onPressed: () {
                            refRead.changeSelectedMenu("About");
                          },
                          child: Text(
                            "About",
                            style: TextStyle(
                              color: selectedMenu == "About"
                                  ? Colors.orange
                                  : Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        TextButton(
                          onPressed: () {
                            refRead.changeSelectedMenu("Experience");
                          },
                          child: Text(
                            "Experience",
                            style: TextStyle(
                              color: selectedMenu == "Experience"
                                  ? Colors.orange
                                  : Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        TextButton(
                          onPressed: () {
                            refRead.changeSelectedMenu("Portfolio");
                          },
                          child: Text(
                            "Portfolio",
                            style: TextStyle(
                              color: selectedMenu == "Portfolio"
                                  ? Colors.orange
                                  : Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        TextButton(
                          onPressed: () {
                            refRead.changeSelectedMenu("Services");
                          },
                          child: Text(
                            "Services",
                            style: TextStyle(
                              color: selectedMenu == "Services"
                                  ? Colors.orange
                                  : Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
