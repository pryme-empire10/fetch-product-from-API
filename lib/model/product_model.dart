class ProductModel {
  final String title;
  final int price;
  final double rating;
  final String imageUrl;
  final String description;
  final String brand;
  final String category;

  ProductModel({
    required this.title,
    required this.price,
    required this.rating,
    required this.imageUrl,
    required this.description,
    required this.brand,
    required this.category,
  });

  factory ProductModel.fromMap(Map<String, dynamic> e) {
    return ProductModel(
      title: e['title'],
      price: e['price'],
      rating: e['rating'].toDouble(),
      imageUrl: e['thumbnail'],
      description: e['description'],
      brand: e['brand'],
      category: e['category'],
    );
  }
}
