import 'package:abd_garments/widget/cartmodel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/models.dart';

class Cart extends StatefulWidget {
  final List<Item> items;
  Cart({super.key, required this.items});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    num total = 0;
    for(int i = 0 ; i<widget.items.length;i++){
        total = total + widget.items[i].price;
    }
    return Scaffold(
      appBar: AppBar(
        title: 'Cart'.text.make(),
        backgroundColor: context.canvasColor,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: widget.items.length,
                itemBuilder: (context, i) {
                  return DisplayCartItem(cartItem: widget.items[i],deleteItem: (){
                    widget.items.removeAt(i);
                    setState(() {
                      
                    });
                  },addItem: (){
                    widget.items.add(widget.items[i]);
                    setState(() {
                      
                    });
                  },);
                }),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                '\$ ${total}'.text.xl3.make(),
                ElevatedButton(
                  onPressed: () {}, 
                child: 'Buy'.text.xl2.size(16).make(),
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(context.theme.floatingActionButtonTheme.backgroundColor),
                  shape: MaterialStatePropertyAll(StadiumBorder())
                ),).wh(130,40),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class DisplayCartItem extends StatelessWidget {
  final Item cartItem;
  final Function()? deleteItem;
  final Function()? addItem;
  const DisplayCartItem({super.key, required this.cartItem,this.deleteItem, this.addItem});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.check),
      title: Text(cartItem.name, style:(TextStyle(fontSize: 20 )),),
      trailing: Container(
        width: 200,height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(onPressed: deleteItem, icon: Icon(Icons.delete)),
             IconButton(onPressed: addItem, icon: Icon(Icons.add)),
          ],
        ),
      ),
    );
  }
}
