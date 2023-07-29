import 'dart:developer';

import 'package:flashcoders/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quill_html_editor/quill_html_editor.dart';

import '../../global_components/app_bar/x_app_bar.dart';
import 'create_blog_notifier.dart';

class QuillEditor extends StatefulWidget {
  const QuillEditor({super.key});

  @override
  State<QuillEditor> createState() => _QuillEditorState();
}

class _QuillEditorState extends State<QuillEditor> {
  ///[controller] create a QuillEditorController to access the editor methods
  late QuillEditorController controller;

  ///[customToolBarList] pass the custom toolbarList to show only selected styles in the editor

  final customToolBarList = [
    ToolBarStyle.bold,
    ToolBarStyle.italic,
    ToolBarStyle.align,
    ToolBarStyle.color,
    ToolBarStyle.background,
    ToolBarStyle.listBullet,
    ToolBarStyle.listOrdered,
    ToolBarStyle.clean,
    ToolBarStyle.addTable,
    ToolBarStyle.editTable,
  ];

  final _toolbarColor = Colors.grey.shade200;
  final _backgroundColor = Colors.white70;
  final _toolbarIconColor = Colors.black87;
  final _editorTextStyle = const TextStyle(
      fontSize: 18,
      color: Colors.black,
      fontWeight: FontWeight.normal,
      fontFamily: 'Roboto');
  final _hintTextStyle = const TextStyle(
      fontSize: 18, color: Colors.black12, fontWeight: FontWeight.normal);

  bool _hasFocus = false;
  @override
  void initState() {
    super.initState();
    controller = QuillEditorController();
    controller.onTextChanged((text) {
      debugPrint('listening to $text');
    });
    controller.onEditorLoaded(() {
      debugPrint('Editor Loaded :)');
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const XAppBar(),
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 160.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 50,
                child: ToolBar.scroll(
                  toolBarColor: _toolbarColor,
                  padding: const EdgeInsets.all(8),
                  iconSize: 25,
                  iconColor: _toolbarIconColor,
                  activeIconColor: Colors.greenAccent.shade400,
                  controller: controller,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  direction: Axis.vertical,
                  customButtons: [
                    Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                          color: _hasFocus ? Colors.green : Colors.grey,
                          borderRadius: BorderRadius.circular(15)),
                    ),
                    InkWell(
                        onTap: () => unFocusEditor(),
                        child: const Icon(
                          Icons.favorite,
                          color: Colors.black,
                        )),
                    InkWell(
                        onTap: () async {
                          var selectedText = await controller.getSelectedText();
                          debugPrint('selectedText $selectedText');
                          var selectedHtmlText =
                              await controller.getSelectedHtmlText();
                          debugPrint('selectedHtmlText $selectedHtmlText');
                        },
                        child: const Icon(
                          Icons.add_circle,
                          color: Colors.black,
                        )),
                  ],
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                child: QuillHtmlEditor(
                  text:
                      "<h1>Hey Bloggers</h1>We're eagerly waiting to for your next blog, Write something cool 😊",
                  hintText: 'Share the knowledge with the world',
                  controller: controller,
                  isEnabled: true,
                  ensureVisible: false,
                  minHeight: 200,
                  textStyle: _editorTextStyle,
                  hintTextStyle: _hintTextStyle,
                  hintTextAlign: TextAlign.start,
                  padding: const EdgeInsets.only(left: 10, top: 10),
                  hintTextPadding: const EdgeInsets.only(left: 20),
                  backgroundColor: _backgroundColor,
                  loadingBuilder: (context) {
                    return const Center(
                        child: CircularProgressIndicator(
                      strokeWidth: 0.4,
                    ));
                  },
                  onFocusChanged: (focus) {
                    debugPrint('has focus $focus');
                    setState(() {
                      _hasFocus = focus;
                    });
                  },
                  onTextChanged: (text) =>
                      debugPrint('widget text change $text'),
                  onEditorCreated: () {
                    debugPrint('Editor has been loaded');
                  },
                  onEditorResized: (height) =>
                      debugPrint('Editor resized $height'),
                  onSelectionChanged: (sel) =>
                      debugPrint('index ${sel.index}, range ${sel.length}'),
                ),
              ),
              SizedBox(
                width: 350,
                child: Consumer(builder: (context, ref, child) {
                  final refRead = ref.read(createBlogNotifierProvider.notifier);
                  final blogModel = ref.watch(createBlogNotifierProvider);
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ElevatedButton(
                        onPressed: blogModel.isLoading
                            ? null
                            : () {
                                refRead.pickImage();
                              },
                        child: const Text("Add a cover image"),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      blogModel.value != null && blogModel.value?.image != null
                          ? InkWell(
                              onTap: () {
                                refRead.clearImage();
                              },
                              child: Stack(
                                children: [
                                  SizedBox(
                                    width: 200,
                                    height: 200,
                                    child:
                                        Image.memory(blogModel.value!.image!),
                                  ),
                                  Positioned.fill(
                                    child: Align(
                                      alignment: Alignment.topRight,
                                      child: Container(
                                        width: 25,
                                        height: 25,
                                        decoration: const BoxDecoration(
                                          color: AppColors.primaryBlackColor,
                                          shape: BoxShape.circle,
                                        ),
                                        child: const Center(
                                          child: Icon(
                                            Icons.close,
                                            color: Colors.white,
                                            size: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          : const SizedBox()
                    ],
                  );
                }),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 160.0),
        child: Visibility(
          visible: true,
          child: Container(
            width: double.maxFinite,
            color: _toolbarColor,
            child: Wrap(
              children: [
                textButton(
                    text: 'Undo',
                    onPressed: () {
                      controller.undo();
                    }),
                textButton(
                    text: 'Redo',
                    onPressed: () {
                      controller.redo();
                    }),
                textButton(
                    text: 'Clear',
                    onPressed: () {
                      controller.clear();
                    }),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20.0,
                    top: 4,
                  ),
                  child: Consumer(builder: (context, ref, child) {
                    final refRead =
                        ref.read(createBlogNotifierProvider.notifier);
                    final blogModel = ref.watch(createBlogNotifierProvider);
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryBlackColor,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                        ),
                      ),
                      onPressed: blogModel.isLoading
                          ? null
                          : () async {
                              try {
                                final data = await controller.getText();
                                await refRead.publishBlog(context, data);
                                controller.clear();
                              } catch (e) {
                                log("$e");
                              }
                            },
                      child: blogModel.isLoading
                          ? const SizedBox(
                              width: 15,
                              height: 15,
                              child: CircularProgressIndicator(
                                backgroundColor: Colors.white,
                                strokeWidth: 2,
                              ),
                            )
                          : const Text(
                              "Publish",
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget textButton({required String text, required VoidCallback onPressed}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MaterialButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          color: _toolbarIconColor,
          onPressed: onPressed,
          child: Text(
            text,
            style: TextStyle(color: _toolbarColor),
          )),
    );
  }

  ///[getHtmlText] to get the html text from editor
  void getHtmlText() async {
    String? htmlText = await controller.getText();
    debugPrint(htmlText);
  }

  ///[setHtmlText] to set the html text to editor
  void setHtmlText(String text) async {
    await controller.setText(text);
  }

  ///[insertNetworkImage] to set the html text to editor
  void insertNetworkImage(String url) async {
    await controller.embedImage(url);
  }

  ///[insertVideoURL] to set the video url to editor
  ///this method recognises the inserted url and sanitize to make it embeddable url
  ///eg: converts youtube video to embed video, same for vimeo
  void insertVideoURL(String url) async {
    await controller.embedVideo(url);
  }

  /// to set the html text to editor
  /// if index is not set, it will be inserted at the cursor postion
  void insertHtmlText(String text, {int? index}) async {
    await controller.insertText(text, index: index);
  }

  /// to clear the editor
  void clearEditor() => controller.clear();

  /// to enable/disable the editor
  void enableEditor(bool enable) => controller.enableEditor(enable);

  /// method to un focus editor
  void unFocusEditor() => controller.unFocus();
}
