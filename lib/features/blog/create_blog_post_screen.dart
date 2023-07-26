import 'package:firebase_auth/firebase_auth.dart';
import 'package:flashcoders/global_components/app_bar/x_app_bar.dart';
import 'package:flashcoders/global_components/floating_action_button.dart';
import 'package:flashcoders/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:quill_html_editor/quill_html_editor.dart';

class CreateBlogPostScreen extends StatelessWidget {
  CreateBlogPostScreen({super.key});

  final QuillEditorController controller = QuillEditorController();

  final String name = FirebaseAuth.instance.currentUser?.displayName ?? "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const XAppBar(),
      floatingActionButton: const XFloatingActionButton(),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 160.0,
          right: 160,
        ),
        child: Column(
          children: [
            ToolBar(
              toolBarColor: Colors.cyan.shade50,
              activeIconColor: Colors.green,
              padding: const EdgeInsets.all(8),
              iconSize: 20,
              controller: controller,
              customButtons: [
                InkWell(onTap: () {}, child: const Icon(Icons.favorite)),
                InkWell(onTap: () {}, child: const Icon(Icons.add_circle)),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.6,
              child: QuillHtmlEditor(
                text: "<h1>Welcome</h1>Share what you know😊",
                hintText: 'Write blog post',
                controller: controller,
                isEnabled: true,
                minHeight: MediaQuery.of(context).size.height * 0.6,
                textStyle: const TextStyle(),
                hintTextStyle: const TextStyle(),
                hintTextAlign: TextAlign.start,
                padding: const EdgeInsets.only(left: 10, top: 5),
                hintTextPadding: EdgeInsets.zero,
                backgroundColor: Colors.white,
                onFocusChanged: (hasFocus) => debugPrint('has focus $hasFocus'),
                onTextChanged: (text) => debugPrint('widget text change $text'),
                onEditorCreated: () => debugPrint('Editor has been loaded'),
                onEditorResized: (height) =>
                    debugPrint('Editor resized $height'),
                onSelectionChanged: (sel) =>
                    debugPrint('${sel.index},${sel.length}'),
                loadingBuilder: (context) {
                  return const Center(
                      child: CircularProgressIndicator(
                    strokeWidth: 0.4,
                  ));
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryBlackColor,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    "Publish",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
