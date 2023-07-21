import 'package:flashcoders/features/flutter-institute/flutter_institute_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FlutterInstituteNavTextButton extends StatelessWidget {
  const FlutterInstituteNavTextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: () {
            context.pushReplacementNamed(FlutterInstitutePath.flutterInstitute);
          },
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.school_rounded,
                color: Color(0xff00008B),
                size: 24,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                "Flutter Institute",
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
              SizedBox(
                width: 3,
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 24,
        )
      ],
    );
  }
}
