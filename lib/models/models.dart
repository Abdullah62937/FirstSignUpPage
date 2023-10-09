// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Catalog {
  static List<Item> product = [];

  Catalog(catalog);
}

class Item {
  final int id;
  final String name;
  final String desc;
  final String price;
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

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map['id'] as int,
      name: map['name'] as String,
      desc: map['desc'] as String,
      price: map['price'] as String,
      color: map['color'] as String,
      img: map['img'] as String,
      details: map['details'] as String,
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

  Item copyWith({
    int? id,
    String? name,
    String? desc,
    String? price,
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

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) => Item.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Item(id: $id, name: $name, desc: $desc, price: $price, color: $color, img: $img, details: $details)';
  }

  @override
  bool operator ==(covariant Item other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.desc == desc &&
      other.price == price &&
      other.color == color &&
      other.img == img &&
      other.details == details;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      desc.hashCode ^
      price.hashCode ^
      color.hashCode ^
      img.hashCode ^
      details.hashCode;
  }
}
