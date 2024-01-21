import 'package:flashcoders/features/portfolio/component/about_me.dart';
import 'package:flashcoders/features/portfolio/component/experience.dart';
import 'package:flashcoders/features/portfolio/component/top_profile.dart';
import 'package:flutter/material.dart';

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({super.key});

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  String selectedMenu = "About";
  Widget getBody() {
    switch (selectedMenu) {
      case "About":
        return const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TopProfile(),
            SizedBox(
              height: 16,
            ),
            AboutMe(),
          ],
        );
      case "Experience":
        return const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TopProfile(),
            SizedBox(
              height: 16,
            ),
            PortfolioExperience(),
          ],
        );
      case "Portfolio":
        return const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TopProfile(),
            SizedBox(
              height: 16,
            ),
          ],
        );
      case "Services":
        return const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TopProfile(),
            SizedBox(
              height: 16,
            ),
          ],
        );
      default:
        return const Column(
          children: [],
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff121212),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        child: Container(
            height: 70,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              color: Color(0xff282829),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    onPressed: () {
                      if (context.mounted) {
                        setState(() {
                          selectedMenu = "About";
                        });
                      }
                    },
                    child: Text(
                      "About",
                      style: TextStyle(
                        color: selectedMenu == "About"
                            ? Colors.orange
                            : Colors.white,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      if (context.mounted) {
                        setState(() {
                          selectedMenu = "Experience";
                        });
                      }
                    },
                    child: Text(
                      "Experience",
                      style: TextStyle(
                        color: selectedMenu == "Experience"
                            ? Colors.orange
                            : Colors.white,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      if (context.mounted) {
                        setState(() {
                          selectedMenu = "Portfolio";
                        });
                      }
                    },
                    child: Text(
                      "Portfolio",
                      style: TextStyle(
                        color: selectedMenu == "Portfolio"
                            ? Colors.orange
                            : Colors.white,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      if (context.mounted) {
                        setState(() {
                          selectedMenu = "Services";
                        });
                      }
                    },
                    child: Text(
                      "Services",
                      style: TextStyle(
                        color: selectedMenu == "Services"
                            ? Colors.orange
                            : Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: getBody(),
          ),
        ),
      ),
    );
  }
}
