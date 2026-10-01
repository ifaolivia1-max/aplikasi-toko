class Product {
  final int? id;
  final String name;
  final double price;
  final String category;
  final String image;

  Product({
    this.id,
    required this.name,
    required this.price,
    required this.category,
    required this.image,
  });

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'],
      name: map['name'],
      price: (map['price'] as num).toDouble(),
      category: map['category'] ?? 'Semua',
      image: map['image'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'category': category,
      'image': image,
    };
  }
}