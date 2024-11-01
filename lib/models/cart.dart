import 'package:eca/models/shoe.dart';
import 'package:flutter/foundation.dart';

class Cart extends ChangeNotifier {
  List<Shoe> shoeShop = [
    Shoe(
        name: "ANTA KAI 1 'Yin'",
        price: "125.00",
        imagePath: "lib/images/s1.webp",
        description:
            "Rooted in the ancient Eastern philosophy of Yin and Yang, The ANTA KAI 1 'Yin' embodies stillness, focus, and hidden power."),
    Shoe(
        name: "ANTA KAI 1 SPEED 'Twin Flame'",
        price: "125.00",
        imagePath: "lib/images/s2.webp",
        description:
            "The ANTA KAI 1 SPEED 'Twin Flame' is more than just footwear. It celebrates love, heritage, and the power of family. These are the values that make the game mean that much more."),
    Shoe(
        name: "ANTA KAI 1 'Yang'",
        price: "125.00",
        imagePath: "lib/images/s3.webp",
        description:
            "The ANTA KAI 1 'Yang' symbolizes light, action, and vitality. This colorway captures Kyrie’s lightning-fast speed and agility on the court."),
    Shoe(
        name: "ANTA ULT Dune Runner",
        price: "120.00",
        imagePath: "lib/images/s4.webp",
        description:
            "Lightweight and durable, perfect for everyday adventures. Inspired by the unique landscapes and climates of different planets, created to be used on any terrain. "),
  ];

  List<Shoe> userCart = [];

  List<Shoe> getShoeList() {
    return shoeShop;
  }

  List<Shoe> getUserCart() {
    return userCart;
  }

  void addItemToCart(Shoe shoe) {
    userCart.add(shoe);
    notifyListeners();
  }

  void removeItemFromCart(Shoe shoe) {
    userCart.remove(shoe);
    notifyListeners();
  }
}
