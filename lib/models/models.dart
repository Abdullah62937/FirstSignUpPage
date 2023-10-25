// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:abd_garments/home_page.dart';
import 'package:abd_garments/widget/cartmodel.dart';

class Catalog {

  static final catModel = Catalog._internal();
  Catalog._internal();

  factory Catalog(item)=>catModel;

  static List<Item> product = [];

  Item getById(int id) =>
      product.firstWhere((element) => element.id == id, orElse: null);

  Item getByPosition(int pos) => product[pos];
}

class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String img;
  final String details;

  Item({
    required this.id,
    required this.name,
    required this.desc,
    required this.price,
    required this.color,
    required this.img,
    required this.details,
  });

 
  Item copyWith({
    int? id,
    String? name,
    String? desc,
    num? price,
    String? color,
    String? img,
    String? details,
  }) {
    return Item(
      id: id ?? this.id,
      name: name ?? this.name,
      desc: desc ?? this.desc,
      price: price ?? this.price,
      color: color ?? this.color,
      img: img ?? this.img,
      details: details ?? this.details,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'desc': desc,
      'price': price,
      'color': color,
      'img': img,
      'details': details,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map['id'] as int,
      name: map['name'] as String,
      desc: map['desc'] as String,
      price: map['price'] as num,
      color: map['color'] as String,
      img: map['img'] as String,
      details: map['details'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) => Item.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Item(id: $id, name: $name, desc: $desc, price: $price, color: $color, image: $img)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Item &&
        o.id == id &&
        o.name == name &&
        o.desc == desc &&
        o.price == price &&
        o.color == color &&
        o.img == img;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        desc.hashCode ^
        price.hashCode ^
        color.hashCode ^
        img.hashCode;
  }
}
