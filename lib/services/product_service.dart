import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/product_model.dart';

class ProductService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  static const String collectionName = 'products';

  Future<List<Product>> getAllProducts() async {
    try {
      final snapshot = await _db.collection(collectionName).get();
      return snapshot.docs
          .map((doc) => Product.fromMap(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw Exception('Failed to fetch products: $e');
    }
  }

  Future<List<Product>> getProductsByCategory(String category) async {
    try {
      final snapshot = await _db
          .collection(collectionName)
          .where('category', isEqualTo: category)
          .get();

      return snapshot.docs
          .map((doc) => Product.fromMap(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw Exception('Failed to fetch products: $e');
    }
  }

  Future<Product> getProductById(String productId) async {
    try {
      final doc = await _db.collection(collectionName).doc(productId).get();
      if (doc.exists) {
        return Product.fromMap(doc.data() as Map<String, dynamic>);
      }
      throw Exception('Product not found');
    } catch (e) {
      throw Exception('Failed to fetch product: $e');
    }
  }
}
