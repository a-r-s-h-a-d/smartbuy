import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartbuy/pages/home/widgets/product_structure.dart';
import 'package:smartbuy/pages/product_details/screen_product_details.dart';
import 'package:smartbuy/services/models/products/model_product.dart';

class ProductSearchDelegate extends SearchDelegate<String> {
  final Stream<List<Products>> productsStream;
  final double height;
  final double width;

  ProductSearchDelegate({
    required this.productsStream,
    required this.height,
    required this.width,
  });

  @override
  String get searchFieldLabel => 'Search products';

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return StreamBuilder<List<Products>>(
      stream: productsStream,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        final products = snapshot.data!;
        final searchResults = products
            .where((product) =>
                product.productname.toLowerCase().contains(query.toLowerCase()))
            .toList();

        return GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 0.69,
          crossAxisSpacing: 10,
          mainAxisSpacing: 0,
          children: searchResults.map((product) {
            return ProductStructure(
                screenname: product.productname,
                product: product,
                height: height,
                width: width);
          }).toList(),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return StreamBuilder<List<Products>>(
      stream: productsStream,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        final products = snapshot.data!;
        final searchResults = products
            .where((product) =>
                product.productname.toLowerCase().contains(query.toLowerCase()))
            .toList();

        return GridView.count(
          crossAxisCount: 2,
          padding: const EdgeInsets.all(16),
          childAspectRatio: 0.7,
          children: searchResults.map((product) {
            return InkWell(
                onTap: () {
                  FocusScope.of(context).unfocus();
                  Get.to(() => ScreenProductDetails(
                        product: product,
                      ));
                },
                child: ProductStructure(
                    screenname: product.productname,
                    product: product,
                    height: height,
                    width: width));
          }).toList(),
        );
      },
    );
  }
}
