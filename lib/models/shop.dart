import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/models/perfume.dart';

class Shop extends ChangeNotifier {
  final List<Perfume> _perfumemenu = [
    Perfume(
        name: "Aden", price: 18, imagepath: "images/per/aden.jpg", count: 0),
    Perfume(
        name: "Chanel Coco ",
        price: 144,
        imagepath: "images/per/chanel.jpg",
        count: 0),
    Perfume(
        name: "Code", price: 24, imagepath: "images/per/code.jpg", count: 0),
    Perfume(
        name: "Dream", price: 30, imagepath: "images/per/dream.jpg", count: 0),
    Perfume(
        name: "Bella Vita Fresh",
        price: 28,
        imagepath: "images/per/fresh.jpg",
        count: 0),
    Perfume(
        name: "Grove", price: 38, imagepath: "images/per/gro.jpg", count: 0),
    Perfume(
        name: "Bella Vita Impact",
        price: 29,
        imagepath: "images/per/impact.jpg",
        count: 0),
    Perfume(
        name: "Mexico",
        price: 31,
        imagepath: "images/per/mexico.jpg",
        count: 0),
    Perfume(
        name: "OudGold", price: 36, imagepath: "images/per/oud.jpg", count: 0),
    Perfume(
        name: "Bella Vita Rose",
        price: 28,
        imagepath: "images/per/rose.jpg",
        count: 0),
    Perfume(
        name: "Riffs", price: 35, imagepath: "images/per/rouge.jpg", count: 0),
    Perfume(
        name: "Royale",
        price: 21,
        imagepath: "images/per/royale.jpg",
        count: 0),
    Perfume(
        name: "Bella Vita Skai",
        price: 29,
        imagepath: "images/per/skai.jpg",
        count: 0),
    Perfume(
        name: "Versac", price: 32, imagepath: "images/per/versac.jpg", count: 0)
  ];

  double _totalPrice = 0.0;
  double _totalAmount = 0.0;
  double get totalPrice => _totalPrice;
  double get totalAmount => _totalAmount;

  List<Perfume> _cart = [];
  int _cartCount = 0;
  List<Perfume> get perfumemenu => _perfumemenu;
  int get perfumecount => _perfumemenu.length;
  List<Perfume> get cart => _cart;
  int get cartItemCount => _cart.length;
  int get cartCount => _cartCount < 0 ? 0 : _cartCount;

  void addToCart(Perfume item) {
    if (_cart.contains(item)) {
      _cart[_cart.indexOf(item)].count++;
    } else {
      _cart.add(item);
      _cart[_cart.indexOf(item)].count = 1;
      _perfumemenu[_perfumemenu.indexOf(item)].count = 1;
    }
    _cartCount++;
    notifyListeners();
  }

  void removeFromCart(Perfume item) {
    if (_cart.contains(item) && _cart[_cart.indexOf(item)].count == 1) {
      _perfumemenu[_perfumemenu.indexOf(item)].count = 0;
      _cart.remove(_cart[_cart.indexOf(item)]);
      _cartCount--;
    } else if (_cart[_cart.indexOf(item)].count > 0) {
      _cart[_cart.indexOf(item)].count--;
      _cartCount--;
    }
    notifyListeners();
  }

  List<Perfume> searchPerfumes(String query) {
    query = query.toLowerCase();
    return _perfumemenu.where((perfume) {
      return perfume.name.toLowerCase().contains(query);
    }).toList();
  }

  double getTotalCartAmount() {
    _totalAmount = 0.0;
    for (Perfume item in _cart) {
      _totalAmount += item.price * item.count;
    }
    print(_totalAmount);
    notifyListeners();
    return _totalAmount;
  }
  // List<WishlistItem> _wishlist = [];
  // List<WishlistItem> get wishlist => _wishlist;
  //
  // void addToWishlist(Perfume perfume) {
  //   final wishlistItem = WishlistItem(
  //     name: perfume.name,
  //     price: perfume.price,
  //     imagepath: perfume.imagepath,
  //   );
  //   _wishlist.add(wishlistItem);
  //   notifyListeners();
  // }
  //
  // void removeFromWishlist(WishlistItem wishlistItem) {
  //   _wishlist.remove(wishlistItem);
  //   notifyListeners();
  // }
}
