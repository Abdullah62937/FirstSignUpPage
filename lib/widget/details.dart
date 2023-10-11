// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:abd_garments/widget/cart.dart';
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
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent ,
        title: 'Catalog App'.text.color(context.theme.floatingActionButtonTheme.foregroundColor).make(),),
      bottomNavigationBar: ButtonBar( 
        alignment: MainAxisAlignment.spaceBetween,
            children: [
              '\$${product.price}'.text.bold.xl3.color(Colors.deepPurple).make(),
              ElevatedButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>Cart())),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(context.theme.floatingActionButtonTheme.backgroundColor),
                shape: MaterialStateProperty.all(StadiumBorder()) ),
              child: 'Add to cart'.text.size(16).make(),).wh(130, 50)
            ],).p32() ,
      body: Center(
        child: Column(children: [
          Image.asset(product.img),
          Expanded(child: VxArc(
            height: 30.0, 
            arcType: VxArcType.convey,
            edge: VxEdge.top,
            child: Container(
              width: context.screenWidth,
              color: context.cardColor,
              child: 
               Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            product.name.text.bold.xl4.color(context.theme.floatingActionButtonTheme.foregroundColor).make(),
            product.desc.text.xl.textStyle(context.captionStyle).make(),
            SizedBox(height: 10,),
            product.details.text.textStyle(context.captionStyle).make(),
          ],
        ).py32(),
            ),
            )
      )
        ],),
      ),
    );
  }
}
