import 'package:flashcoders/global_components/app_bar/x_app_bar.dart';
import 'package:flashcoders/global_components/footer/footer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:html_viewer_elite/html_viewer_elite.dart';
import 'package:url_launcher/url_launcher.dart';

import 'blog_detail_notifier.dart';

class BlogDetailsScreen extends StatelessWidget {
  final int id;
  const BlogDetailsScreen({required this.id, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const XAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 160.0, right: 160.0),
              child: Consumer(builder: (context, ref, child) {
                final refRead = ref.read(blogDetailsNotiferProvider.notifier);
                return FutureBuilder(
                    future: refRead.getBlog(id),
                    builder: (context, snapshot) {
                      final blog = snapshot.data;
                      if (blog?.image == null) {
                        return const Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                          ),
                        );
                      }
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Image.network(
                              blog?.image ?? "",
                              height: 300,
                            ),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          Text(
                            blog?.title ?? "",
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          Html(
                            data: blog?.post ?? "",
                            onLinkTap: (url, context, attributes, element) {
                              launchUrl(Uri.parse(url ?? ""));
                            },
                          ),
                        ],
                      );
                    });
              }),
            ),
            const Footer(),
          ],
        ),
      ),
    );
  }
}
