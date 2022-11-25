class PythonProject {
  String name;
  int year;
  String description;
  String imageAsset;
  List<String>? technologiesUsed;

  PythonProject({
    required this.name,
    required this.year,
    required this.description,
    required this.imageAsset,
    this.technologiesUsed,
  });
}
