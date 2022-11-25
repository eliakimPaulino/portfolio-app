class FlutterProject {
  String name;
  int year;
  String description;
  String imageAsset;
  List<String>? technologiesUsed;

  FlutterProject({
    required this.name,
    required this.year,
    required this.description,
    required this.imageAsset,
    this.technologiesUsed,
  });
}
