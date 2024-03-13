class CartItemEntity {
  final String name;
  final String image;
  final num sellPrice;
  final num mainPrice;
  final num amount;
  final num countLeft;

  CartItemEntity(
      {required this.name,
      required this.image,
      required this.sellPrice,
      required this.mainPrice,
      required this.amount,
      required this.countLeft});
}
