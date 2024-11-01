import 'package:eca/components/shoe_tile.dart';
import 'package:eca/models/cart.dart';
import 'package:eca/models/shoe.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  void addShoeToCart(Shoe shoe) {
    Provider.of<Cart>(context, listen: false).addItemToCart(shoe);
    showDialog(
        context: context,
        builder: (
          context,
        ) {
          return const AlertDialog(
            title: Text("产品添加购物车成功！"),
            content: Text("在结算页查看购物清单。"),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (BuildContext context, value, Widget? child) {
        return Column(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.symmetric(horizontal: 25),
              decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(8)),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "查找商品",
                    style: TextStyle(color: Colors.grey),
                  ),
                  Icon(Icons.search)
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 25),
              child: Text(
                "我们敢于追寻，实现梦想，让生活充满缤纷",
                style: TextStyle(color: Colors.grey),
              ),
            ),
            const Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "热销产品",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Colors.red),
                  ),
                  Text(
                    "查看所有",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.blue),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
                child: ListView.builder(
              itemCount: value.shoeShop.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                Shoe shoe = value.getShoeList()[index];
                return ShoeTile(
                  shoe: shoe,
                  onTap: () {
                    addShoeToCart(shoe);
                  },
                );
              },
            )),
            const Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Divider(
                color: Colors.transparent,
              ),
            )
          ],
        );
      },
    );
  }
}
