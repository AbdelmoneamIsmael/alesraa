class ProductDetailsEntity {
  final String name;
  final String image;
  final String describtion;
  final List<String> budget;
  final num mainPrice;
  final num sellPrice;
  final num raiting;
  final num countLeft;

  ProductDetailsEntity({
    required this.name,
    required this.image,
    required this.describtion,
    required this.budget,
    required this.mainPrice,
    required this.sellPrice,
    required this.raiting,
    required this.countLeft,
  });
}
