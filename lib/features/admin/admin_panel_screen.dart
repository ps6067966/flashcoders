import 'package:flashcoders/features/admin/components/admin_grid_view.dart';
import 'package:flashcoders/global_components/app_bar/x_app_bar.dart';
import 'package:flutter/material.dart';

class AdminPanelScreen extends StatelessWidget {
  const AdminPanelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: XAppBar(),
      body: Column(
        children: [
          AdminGridView(),
        ],
      ),
    );
  }
}
