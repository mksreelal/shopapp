class Perfume {
  String name;
  int price;
  String imagepath;
  int count;

  Perfume(
      {required this.name,
      required this.price,
      required this.imagepath,
      required this.count});

  String get _name => name;
  int get _price => price;
  String get _imagepath => imagepath;
  int get _count => count;
}

class WishlistItem {
  final String name;
  final int price;
  final String imagepath;

  WishlistItem({
    required this.name,
    required this.price,
    required this.imagepath,
  });
}
