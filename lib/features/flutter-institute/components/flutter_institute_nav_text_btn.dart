import 'package:flashcoders/features/flutter-institute/flutter_institute_router.dart';
import 'package:flashcoders/theme/app_colors.dart';
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
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: Icon(
                  Icons.school_rounded,
                  color: GoRouterState.of(context)
                          .location
                          .contains("flutter-institute")
                      ? Colors.amber
                      : const Color(0xff00008B),
                  size: 24,
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                "Flutter Institute",
                style: TextStyle(
                  fontSize: 17,
                  color: GoRouterState.of(context)
                          .location
                          .contains("flutter-institute")
                      ? Colors.white
                      : AppColors.primaryBlackColor,
                ),
              ),
              const SizedBox(
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
