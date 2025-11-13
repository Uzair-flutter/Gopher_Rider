class PGService {
  final String id;
  final String name;
  final String icon;
  final String price;
  bool isSelected;

  PGService({
    required this.id,
    required this.name,
    required this.icon,
    required this.price,
    this.isSelected = false,
  });
}
