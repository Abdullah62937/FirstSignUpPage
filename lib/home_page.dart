// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:abd_garments/models/models.dart';
import 'package:abd_garments/widget/cart.dart';
import 'package:abd_garments/widget/cartmodel.dart';
import 'package:abd_garments/widget/details.dart';
import 'package:abd_garments/widget/drawer.dart';
import 'package:abd_garments/widget/themes.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  List<Item> products = [];
  loadData() async {
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    var productData = decodedData["product"];

    products.addAll(List.from(productData)
        .map<Item>((product) => Item.fromMap(product))
        .toList());
    print(products.toList());
    setState(() {});
  }

  List<Item> cartItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 'Catalog App'
            .text
            .color(context.theme.floatingActionButtonTheme.foregroundColor)
            .make(),
        backgroundColor: context.theme.canvasColor,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Cart(
                      items: cartItems,
                    ))),
        backgroundColor:
            context.theme.floatingActionButtonTheme.backgroundColor,
        child: Icon(
          CupertinoIcons.cart,
          color: Colors.white,
        ),
      ),
      drawer: MyDrawer(),
      backgroundColor: context.canvasColor,
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: products.isEmpty
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, i) => DisplayProduct(
                        item: products[i],
                        onPressed: () {
                          print("check");
                          cartItems.add(products[i]);
                          setState(() {});
                          print(cartItems.length);
                        },
                      )),
        ),
      ),
    );
  }
}

class DisplayProduct extends StatelessWidget {
  DisplayProduct({super.key, required this.item, this.onPressed});
  final Item item;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomeDetails(product: item),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: VxBox(
            child: Row(
          children: [
            Image.asset(item.img)
                .box
                .rounded
                .p8
                .size(50, 100)
                .color(context.canvasColor)
                .make()
                .p16()
                .w40(context),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                item.name.text.xl2
                    .color(
                        context.theme.floatingActionButtonTheme.foregroundColor)
                    .make(),
                item.desc.text.textStyle(context.captionStyle).make(),
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  children: [
                    '\$${item.price}'.text.bold.make(),
                    _AddtoCart(
                      onPressed: onPressed,
                    )
                  ],
                )
              ],
            ))
          ],
        )).color(context.cardColor).rounded.make(),
      ),
    );
  }
}

class _AddtoCart extends StatefulWidget {
  final Function()? onPressed;
  const _AddtoCart({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<_AddtoCart> createState() => _AddtoCartState();
}

class _AddtoCartState extends State<_AddtoCart> {
  bool isInCart = false;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        widget.onPressed!();
        isInCart = isInCart.toggle();
        setState(() {});
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
              context.theme.floatingActionButtonTheme.backgroundColor),
          shape: MaterialStateProperty.all(StadiumBorder())),
      child: isInCart ? Icon(Icons.done) : 'Add to cart'.text.make(),
    );
  }
}
