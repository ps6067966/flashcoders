import 'package:flashcoders/features/portfolio/desktop_component/about_me.dart';
import 'package:flashcoders/features/portfolio/desktop_component/experience.dart';
import 'package:flashcoders/features/portfolio/desktop_component/past_works.dart';
import 'package:flashcoders/features/portfolio/desktop_component/services.dart';
import 'package:flashcoders/features/portfolio/desktop_component/top_profile.dart';
import 'package:flashcoders/features/portfolio/m_portfolio_screen.dart';
import 'package:flashcoders/global_components/xresponsive_wrapper.dart';
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
        return const Padding(
          padding: EdgeInsets.all(50.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TopProfile(),
              SizedBox(
                width: 16,
              ),
              Expanded(child: AboutMe()),
            ],
          ),
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
            PastWorks(),
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
            PostfolioServices(),
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
    return XResponsiveWrapper(
      mobile: const MPortfolioScreen(),
      desktop: Scaffold(
        backgroundColor: const Color(0xff121212),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: getBody(),
            ),
          ),
        ),
      ),
    );
  }
}
