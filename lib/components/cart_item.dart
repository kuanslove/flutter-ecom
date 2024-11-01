import 'package:eca/models/cart.dart';
import 'package:eca/models/shoe.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartItem extends StatefulWidget {
  Shoe shoe;
  CartItem({super.key, required this.shoe});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  void removeItemFromCart() {
    Provider.of<Cart>(context, listen: false).removeItemFromCart(widget.shoe);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.red, borderRadius: BorderRadius.circular(8)),
      margin: EdgeInsets.only(top: 10),
      child: ListTile(
        leading: Image.asset(widget.shoe.imagePath),
        title: Text(
          widget.shoe.name,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: Colors.white),
        ),
        subtitle:
            Text(widget.shoe.price, style: TextStyle(color: Colors.white54)),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          color: Colors.white54,
          onPressed: removeItemFromCart,
        ),
      ),
    );
  }
}
