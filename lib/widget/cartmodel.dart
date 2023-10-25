// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:abd_garments/models/models.dart';

class CartModel {

  static final cartModel = CartModel._internal();
  CartModel._internal();

  factory CartModel()=>cartModel;

   Catalog _catalog = Catalog(Item);
  

  final List<int> _itemIds = [];

  Catalog get catalog => catalog;

  set catalog(Catalog newCatalog){
    assert(newCatalog!=null);
    _catalog = newCatalog;
  }

  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  num get totalPrice => items.fold(0, (total, current) => total + current.price);

  void add(Item item){
    _itemIds.add(item.id);
  }

  void remove(Item item){
    _itemIds.remove(item.id);
  }
}