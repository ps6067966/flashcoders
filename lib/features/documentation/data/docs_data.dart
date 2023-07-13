import 'package:flashcoders/features/documentation/1_getting_started/code_guide.dart';
import 'package:flashcoders/features/documentation/1_getting_started/how_to_contribute.dart';

import '../1_getting_started/introduction.dart';
import '../model/docs_model.dart';
import '../model/docs_view_model.dart';

class DocsData {
  static List<DocsHeadingModel> headingData = [
    DocsHeadingModel(
      title: "Getting Started",
      subHeadings: [
        DocsSubHeadingModel(title: "Introduction", path: introductionPath),
        DocsSubHeadingModel(
            title: "How to contribute?", path: howToContributePath),
        DocsSubHeadingModel(title: "Code Guide", path: codeGuidePath),
      ],
    ),
  ];

  static List<DocsViewModel> docsViewData = [
    DocsViewModel(
      path: introductionPath,
      htmlView: introductionHtml,
    ),
    DocsViewModel(
      path: howToContributePath,
      htmlView: howToContributeHtml,
    ),
    DocsViewModel(
      path: codeGuidePath,
      htmlView: codeGuideHtml,
    ),
  ];
}
