// lib/domain/usecases/add_item.dart
import 'package:mon_marche_domestique/features/items/domain/repository/item_repository.dart';

class UploadJsonFile {
  final ItemRepository repository;

  UploadJsonFile(this.repository);

  Future<void> call() async {
    await repository.uploadJsonToFirestore();
  }
}
