class Product {
  static const String keyId = 'id';
  static const String keyTitle = 'title';
  static const String keyDescription = 'description';
  static const String keyPrice = 'price';
  static const String keyDiscountPercentage = 'discountPercentage';
  static const String keyRating = 'rating';
  static const String keyStock = 'stock';
  static const String keyBrand = 'brand';
  static const String keyCategory = 'category';
  static const String keyThumbnail = 'thumbnail';
  static const String keyImages = 'images';

  int id;
  String title;
  String description;
  int price;
  double discountPercentage;
  double rating;
  int stock;
  String brand;
  String category;
  String thumbnail;
  List<String> images;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.brand,
    required this.category,
    required this.thumbnail,
    required this.images,
  });

  static Product fromAPI(Map<String, dynamic> map) {
    final images = <String>[];

    for (final imageString in map[keyImages]) {
      images.add(imageString);
    }

    return Product(
      id: map[keyId],
      title: map[keyTitle],
      description: map[keyDescription],
      price: map[keyPrice],
      discountPercentage: map[keyDiscountPercentage],
      rating: double.parse(map[keyRating].toString()),
      stock: map[keyStock],
      brand: map[keyBrand],
      category: map[keyCategory],
      thumbnail: map[keyThumbnail],
      images: images,
    );
  }
}
