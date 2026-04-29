class Medicine {
  final String id;
  final String name;
  final String time;
  final String imagePath;
  bool taken;

  Medicine({
    required this.id,
    required this.name,
    required this.time,
    required this.imagePath,
    this.taken = false,
  });
}
