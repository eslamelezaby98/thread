import 'package:flutter/material.dart';

class ResponsiveWisget extends StatelessWidget {
  const ResponsiveWisget({
    Key? key,
    required this.mobile,
    required this.tablet,
    required this.web,
  }) : super(key: key);
  final Widget mobile;
  final Widget web;
  final Widget? tablet;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 1200) {
          return web;
        } else if (constraints.maxWidth >= 800) {
          return tablet ?? mobile;
        } else {
          return mobile;
        }
      },
    );
  }
}
