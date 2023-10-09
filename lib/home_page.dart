// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:abd_garments/widget/details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:abd_garments/models/models.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: 'Catalog App'.text.make(),),
      drawer: MyDrawer(),
      backgroundColor: MyTheme.creamColor,
      body:SafeArea(
        child: Container(
          padding: Vx.m32,
          child: products.isEmpty
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
               
                itemCount: products.length,
                itemBuilder: (context,i)=>DisplayProduct(item: products[i])),
        ),
      ),
    );
  }
}

class DisplayProduct extends StatelessWidget {
  const DisplayProduct({super.key, required this.item});
  final Item item;
 
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
              Image.asset(item.img).box.rounded.p8.size(50, 100).color(MyTheme.creamColor).make().p16().w40(context),
          Expanded(child: 
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              item.name.text.xl2.color(MyTheme.darkBluish).make(),
              item.desc.text.textStyle(context.captionStyle).make(),
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
              children: [
                '\$${item.price}'.text.bold.make(),
                ElevatedButton(onPressed: (){},
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(MyTheme.darkBluish),
                  shape: MaterialStateProperty.all(StadiumBorder()) ),
                child: 'Buy'.text.make(),)
              ],
              )
            ],
          ))
          ],
                )
            ).white.rounded.make(),
      ),
    );
  }
}
