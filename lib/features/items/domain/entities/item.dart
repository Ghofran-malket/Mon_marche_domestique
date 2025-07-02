class Item {
  final String name;
  final String mark;
  String quantity;
  final DateTime createdAt;
  final DateTime expirationDate;
  List image;
  final String description;

  Item({required this.name, required this.mark, required this.quantity, 
  required this.createdAt, required this.expirationDate, required this.image, required this.description});
}