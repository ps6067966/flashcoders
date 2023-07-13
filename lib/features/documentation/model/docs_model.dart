class DocsHeadingModel {
  String? title;
  List<DocsSubHeadingModel>? subHeadings;
  DocsHeadingModel({
    this.title,
    this.subHeadings,
  });
}

class DocsSubHeadingModel {
  String? title;
  String? path;
  DocsSubHeadingModel({
    this.title,
    this.path,
  });
}
