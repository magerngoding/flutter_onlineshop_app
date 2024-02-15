import '../../../core/extensions/int_ext.dart';
import 'store_model.dart';

class Product {
  final List<String> images;
  final String name;
  final int price;
  final int stock;
  final String description;
  final StoreModel store;

  Product({
    required this.images,
    required this.name,
    required this.price,
    required this.stock,
    required this.description,
    required this.store,
  });

  String get priceFormat => price.currencyFormatRp;
}
