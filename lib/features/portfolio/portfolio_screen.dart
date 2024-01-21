import 'package:flashcoders/features/portfolio/desktop_component/about_me.dart';
import 'package:flashcoders/features/portfolio/desktop_component/experience.dart';
import 'package:flashcoders/features/portfolio/desktop_component/past_works.dart';
import 'package:flashcoders/features/portfolio/desktop_component/services.dart';
import 'package:flashcoders/features/portfolio/desktop_component/top_profile.dart';
import 'package:flashcoders/features/portfolio/m_portfolio_screen.dart';
import 'package:flashcoders/features/portfolio/portfolio_notifier.dart';
import 'package:flashcoders/global_components/xresponsive_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({super.key});

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  Widget getBody(String selectedMenu) {
    switch (selectedMenu) {
      case "About":
        return const Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TopProfile(),
            SizedBox(
              width: 16,
            ),
            Expanded(child: AboutMe()),
          ],
        );
      case "Experience":
        return const Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TopProfile(),
            SizedBox(
              width: 16,
            ),
            Expanded(child: PortfolioExperience()),
          ],
        );
      case "Portfolio":
        return const Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TopProfile(),
            SizedBox(
              width: 16,
            ),
            Expanded(child: PastWorks()),
          ],
        );
      case "Services":
        return const Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TopProfile(),
            SizedBox(
              width: 16,
            ),
            Expanded(child: PortfolioServices()),
          ],
        );
      default:
        return const Row(
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
              child: Consumer(builder: (context, ref, child) {
                final selectedMenu = ref.watch(portfolioNotifierProvider).value;
                return Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: getBody(selectedMenu ?? "About"),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
