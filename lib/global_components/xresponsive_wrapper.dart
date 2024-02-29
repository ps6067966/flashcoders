import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class XResponsiveWrapper extends StatelessWidget {
  final Widget desktop;
  final Widget mobile;
  const XResponsiveWrapper(
      {super.key, required this.desktop, required this.mobile});

  @override
  Widget build(BuildContext context) {
    if (ResponsiveBreakpoints.of(context).isDesktop) {
      return desktop;
    }
    if (ResponsiveBreakpoints.of(context).isMobile) {
      return mobile;
    }
    return mobile;
  }
}
