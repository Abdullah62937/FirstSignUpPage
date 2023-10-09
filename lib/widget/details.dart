// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:abd_garments/widget/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:abd_garments/models/models.dart';

class HomeDetails extends StatelessWidget {
  const HomeDetails({
    Key? key,
    required this.product,
  }) : 
  assert(Catalog!=null),super(key: key);
  final Item product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent ,
        title: 'Catalog App'.text.make(),),
      bottomNavigationBar: ButtonBar( 
        alignment: MainAxisAlignment.spaceBetween,
            children: [
              '\$${product.price}'.text.bold.xl3.color(Colors.deepPurple).make(),
              ElevatedButton(onPressed: () {},
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(MyTheme.darkBluish),
                shape: MaterialStateProperty.all(StadiumBorder()) ),
              child: 'Buy'.text.size(16).make(),).wh(100, 50)
            ],).p32() ,
      body: Center(
        child: Column(children: [
          Image.asset(product.img),
          Expanded(child: VxArc(
            height: 30.0, 
            arcType: VxArcType.convey,
            edge: VxEdge.top,
            child: Container(
              color: Colors.white,
              child: 
               Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            product.name.text.bold.xl4.color(MyTheme.darkBluish).make(),
            product.desc.text.xl.textStyle(context.captionStyle).make(),
            SizedBox(height: 10,),
            product.details.text.textStyle(context.captionStyle).make(),
          ],
        ).py32(),
            ),
            )
      )
        ],).p16(),
      ),
    );
  }
}
