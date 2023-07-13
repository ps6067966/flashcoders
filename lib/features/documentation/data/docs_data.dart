import '../1_getting_started/introduction.dart';
import '../model/docs_model.dart';
import '../model/docs_view_model.dart';

class DocsData {
  static List<DocsHeadingModel> headingData = [
    DocsHeadingModel(
      title: "Getting Started",
      subHeadings: [
        DocsSubHeadingModel(
            title: "Introduction", path: "/getting-started/introduction"),
        DocsSubHeadingModel(
            title: "Installation", path: "/getting-started/installation"),
        DocsSubHeadingModel(title: "Usage", path: "/getting-started/usage"),
      ],
    ),
  ];

  static List<DocsViewModel> docsViewData = [
    DocsViewModel(
      path: "/getting-started/introduction",
      htmlView: introductionHtml,
    ),
  ];
}
