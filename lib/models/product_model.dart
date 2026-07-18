class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final String category;
  final String imageUrl;
  final int quantity;
  final double rating;
  final int reviews;
  final DateTime createdAt;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.category,
    required this.imageUrl,
    required this.quantity,
    required this.rating,
    required this.reviews,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'category': category,
      'imageUrl': imageUrl,
      'quantity': quantity,
      'rating': rating,
      'reviews': reviews,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      price: map['price'],
      category: map['category'],
      imageUrl: map['imageUrl'],
      quantity: map['quantity'],
      rating: map['rating'],
      reviews: map['reviews'],
      createdAt: DateTime.parse(map['createdAt']),
    );
  }
}
