import 'package:flutter/material.dart';

class PortfolioExperience extends StatefulWidget {
  const PortfolioExperience({super.key});

  @override
  State<PortfolioExperience> createState() => _PortfolioExperienceState();
}

class _PortfolioExperienceState extends State<PortfolioExperience> {
  List<ExperienceModel> experienceList = [
    ExperienceModel(
      companyName: "Bodhisatva Artificial Intelligence Pvt. Ltd.",
      fromDate: "Aug 2023",
      toDate: "Jan 2024",
      position: "Flutter Developer",
      description:
          """WebRTC, dynamically generated pdf’s\nHandling multiple client’s app changes, customized education app for some client.\nUpdated some big projects to null safety and latest version of flutter within few days.  """,
    ),
    ExperienceModel(
      companyName: "GolGol InfoTech Pvt. Ltd.",
      fromDate: "Mar 2023",
      toDate: "Aug 2023",
      position: "Flutter Developer",
      description:
          """Learnt Feature-first approach and why it is better than layer first approach. \nRiverpod Async Notifier, how to manage state using riverpod's most recommended approach.\nIntegration of Getstream chat, Insta like image picker etc.\nLearned how to architect apps and web for responsiveness.\nOther than that, the first time i tried panda CSS and Serverpod.""",
    ),
    ExperienceModel(
      companyName: "GoCrackIt Global Pvt. Ltd.",
      fromDate: "Jan 2022",
      toDate: "Feb 2023",
      position: "Flutter Developer",
      description: """Two Web-Apps""",
    ),
    ExperienceModel(
      companyName: "INDIA WEBLAB TECHNOLOGIES PRIVATE LIMITED",
      fromDate: "Oct 2020",
      toDate: "Feb 2021",
      position: "Software Developer",
      description:
          """Used C# to work on ERP software.\nWorked on window forms for UI designing.\nAzure DevOps.\nWorked on backend SQL Server - stored procedures, fetching data through API, updating, deleting data, and importance of where clause in update and delete.\nLearning from the best authors/developers around the world on pluralsight.com and oreilly.com """,
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
              "Experience",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              width: 100,
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
              shrinkWrap: true,
              itemCount: experienceList.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final experience = experienceList[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 30.0),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.apartment,
                        color: Colors.orangeAccent,
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${experience.position} at ${experience.companyName}",
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Text(
                              "${experience.fromDate} - ${experience.toDate}",
                              style:
                                  const TextStyle(color: Colors.orangeAccent),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Text(
                              experience.description,
                              style: const TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ExperienceModel {
  final String companyName;
  final String position;
  final String fromDate;
  final String toDate;
  final String description;
  ExperienceModel({
    required this.position,
    required this.fromDate,
    required this.toDate,
    required this.companyName,
    required this.description,
  });
}
