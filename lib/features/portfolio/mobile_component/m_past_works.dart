import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MPastWorks extends StatefulWidget {
  const MPastWorks({super.key});

  @override
  State<MPastWorks> createState() => _MPastWorksState();
}

class _MPastWorksState extends State<MPastWorks> {
  List<PastWorksModel> pastWorkList = [
    PastWorksModel(
      title: "Flutter",
      description: "Flutter is awesome",
      image: "https://miro.medium.com/max/1400/1*CKjhkfuvB1QXv_XRKN9WGg.jpeg",
      link: "https://flutter.dev/",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xff1e1e1f),
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
        border: Border.all(
          color: Colors.white.withOpacity(0.1),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Portfolio",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              width: 90,
              child: Divider(
                color: Colors.orangeAccent,
                height: 8,
                thickness: 2,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ListView.builder(
              itemCount: pastWorkList.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final pastWork = pastWorkList[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: InkWell(
                    onTap: () {
                      launchUrl(Uri.parse(pastWork.link));
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                            ),
                            child: Image.network(
                              pastWork.image,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              pastWork.title,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              pastWork.description,
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

class PastWorksModel {
  final String image;
  final String title;
  final String link;
  final String description;
  PastWorksModel(
      {required this.title,
      required this.description,
      required this.image,
      required this.link});
}
