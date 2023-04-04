import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smartbuy/services/models/brand/brand.dart';
import 'package:smartbuy/services/models/products/model_product.dart';

Stream<List<Brand>> listBrands() => FirebaseFirestore.instance
    .collection('brands')
    .snapshots()
    .map((snapshot) =>
        snapshot.docs.map((doc) => Brand.fromJson(doc.data())).toList());

Stream<List<Products>> readProductsbyBrandwise({required String screenname}) {
  return FirebaseFirestore.instance
      .collection('products')
      .where('brand', isEqualTo: screenname)
      .snapshots()
      .map(
        (snapshot) =>
            snapshot.docs.map((doc) => Products.fromJson(doc.data())).toList(),
      );
}

Stream<List<Products>> listProducts() {
  return FirebaseFirestore.instance.collection('products').snapshots().map(
        (snapshot) =>
            snapshot.docs.map((doc) => Products.fromJson(doc.data())).toList(),
      );
}
