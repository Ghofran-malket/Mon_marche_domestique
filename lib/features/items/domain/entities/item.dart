class Item {
  final String name;
  final String mark;
  String quantity;
  final DateTime createdAt;
  final DateTime expirationDate;
  List images;
  final String description;
  final String category;

  Item({required this.name, required this.mark, required this.quantity, 
  required this.createdAt, required this.expirationDate, required this.images, required this.description,
  required this.category});
}