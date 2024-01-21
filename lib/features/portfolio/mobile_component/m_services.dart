import 'package:flutter/material.dart';

class MPortfolioServices extends StatefulWidget {
  const MPortfolioServices({super.key});

  @override
  State<MPortfolioServices> createState() => _MPortfolioServicesState();
}

class _MPortfolioServicesState extends State<MPortfolioServices> {
  List<PortfolioServiceModel> serviceList = [
    PortfolioServiceModel(
        description:
            "I can build beautiful and scalable mobile apps, web apps, admin panel using flutter.",
        image: "https://miro.medium.com/max/1400/1*CKjhkfuvB1QXv_XRKN9WGg.jpeg",
        title: "Flutter"),
    PortfolioServiceModel(
        description:
            "Backend is the heart of any application. I can build scalable backend using serverpod etc.",
        image:
            "https://uploads-ssl.webflow.com/5ee12d8e99cde2e20255c16c/64401c7f8d13678b6744c5d8_image27.png",
        title: "Serverpod"),
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
              "Services",
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
              itemCount: serviceList.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final service = serviceList[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
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
                            service.image,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            service.title,
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
                            service.description,
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
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

class PortfolioServiceModel {
  final String title;
  final String description;
  final String image;
  PortfolioServiceModel(
      {required this.title, required this.description, required this.image});
}
