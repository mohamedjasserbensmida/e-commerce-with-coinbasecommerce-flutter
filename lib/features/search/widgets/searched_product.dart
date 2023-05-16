import 'package:flutter/material.dart';
import 'package:financeLine/common/widgets/stars.dart';
import 'package:financeLine/constants/global_variables.dart';
import 'package:financeLine/models/product.dart';

class SearchedProduct extends StatelessWidget {
  final Product product;
  const SearchedProduct({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double totalRating = 0;
    double avgRating = 0;
    for (int i = 0; i < product.rating!.length; i++) {
      totalRating += product.rating![i].rating;
    }
    if (totalRating != 0) {
      avgRating = totalRating / product.rating!.length;
    }

    double screenWidth = MediaQuery.of(context).size.width;
    double imageWidth = screenWidth * 0.35;
    double textWidth = screenWidth * 0.6;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Image.network(
              product.images[0],
              fit: BoxFit.contain,
              height: imageWidth,
              width: imageWidth,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: textWidth,
                  child: Text(
                    product.name,
                    style: const TextStyle(fontSize: 20),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 5),
                Stars(rating: avgRating),
                const SizedBox(height: 5),
                Text(
                  '\$${product.price}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  'FREE Shipping',
                  style: TextStyle(color: GlobalVariables.secondaryColor),
                ),
                const SizedBox(height: 5),
                const Text(
                  'In Stock',
                  style: TextStyle(color: Colors.teal),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
