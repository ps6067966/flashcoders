import 'package:flashcoders/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class XDrawer extends StatelessWidget {
  const XDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor:
          GoRouterState.of(context).uri.toString().contains("flutter-institute")
              ? AppColors.primaryBlackColor
              : Colors.black,
      child: const Padding(
        padding: EdgeInsets.only(left: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // FirebaseAuth.instance.currentUser != null
            //     ? Center(
            //         child: ElevatedButton(
            //             style: ElevatedButton.styleFrom(
            //               backgroundColor: AppColors.primaryBlackColor,
            //               foregroundColor: Colors.white,
            //               shape: RoundedRectangleBorder(
            //                 borderRadius: BorderRadius.circular(10),
            //               ),
            //             ),
            //             onPressed: () {
            //               FirebaseAuth.instance.signOut();
            //               context.pushReplacement(indexPath);
            //             },
            //             child: const Text("Sign out")),
            //       )
            //     : Center(
            //         child: ElevatedButton(
            //           style: ElevatedButton.styleFrom(
            //             backgroundColor: AppColors.primaryBlackColor,
            //             foregroundColor: Colors.white,
            //             shape: RoundedRectangleBorder(
            //               borderRadius: BorderRadius.circular(10),
            //             ),
            //           ),
            //           onPressed: () {
            //             context.pushReplacementNamed(AuthPath.auth);
            //           },
            //           child: const Text("Sign in"),
            //         ),
            //       ),
          ],
        ),
      ),
    );
  }
}
