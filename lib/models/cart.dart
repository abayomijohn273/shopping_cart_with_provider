import 'package:flutter/foundation.dart';
import 'catalog.dart';

class CartModel extends ChangeNotifier {
  CatalogueModel _catalog;

//  store the ids for each item
  final List<int> _itemIds = [];

//  current id
  CatalogueModel get catalog => _catalog;

  set catalog(CatalogueModel newCatalog) {
    assert(newCatalog != null);
    assert(_itemIds.every((id) => newCatalog.getById(id) == null),
        'The catalog $newCatalog does not have one of $_itemIds in it.');

    _catalog = newCatalog;

    notifyListeners();
  }

//list the item in the cart
  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

//  The current total page
  int get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

//  Add item to cart
  void add(Item item) {
    _itemIds.add(item.id);
    notifyListeners();
  }
}
