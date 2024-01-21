import 'package:flashcoders/features/portfolio/mobile_component/m_about_me.dart';
import 'package:flashcoders/features/portfolio/mobile_component/m_experience.dart';
import 'package:flashcoders/features/portfolio/mobile_component/m_past_works.dart';
import 'package:flashcoders/features/portfolio/mobile_component/m_services.dart';
import 'package:flashcoders/features/portfolio/mobile_component/m_top_profile.dart';
import 'package:flutter/material.dart';

class MPortfolioScreen extends StatefulWidget {
  const MPortfolioScreen({super.key});

  @override
  State<MPortfolioScreen> createState() => _MPortfolioScreenState();
}

class _MPortfolioScreenState extends State<MPortfolioScreen> {
  String selectedMenu = "About";
  Widget getBody() {
    switch (selectedMenu) {
      case "About":
        return const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MTopProfile(),
            SizedBox(
              height: 16,
            ),
            MAboutMe(),
          ],
        );
      case "Experience":
        return const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MTopProfile(),
            SizedBox(
              height: 16,
            ),
            MPortfolioExperience(),
          ],
        );
      case "Portfolio":
        return const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MTopProfile(),
            SizedBox(
              height: 16,
            ),
            MPastWorks(),
          ],
        );
      case "Services":
        return const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MTopProfile(),
            SizedBox(
              height: 16,
            ),
            MPortfolioServices(),
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
