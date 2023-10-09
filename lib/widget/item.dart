import 'package:abd_garments/models/models.dart';
import 'package:flutter/material.dart';

class ItemWidget extends StatelessWidget {
  final Item product;
  const ItemWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(product.img),
      title: Text(product.name),
      subtitle: Text(product.desc),
      trailing: Text("\$${product.price}",
      textScaleFactor: 1.5,
      style: TextStyle(
        color: Color.fromARGB(255, 116, 91, 185),
        fontWeight: FontWeight.bold
      ),),
    );
  }
}