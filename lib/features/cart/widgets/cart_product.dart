// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:financeLine/features/cart/services/cart_services.dart';
import 'package:financeLine/features/product_details/screens/product_details_screen.dart';
import 'package:financeLine/features/product_details/services/product_details_services.dart';
import 'package:financeLine/models/product.dart';
import 'package:financeLine/providers/user_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:provider/provider.dart';

import '../../../constants/global_variables.dart';

class CartProduct extends StatefulWidget {
  final int index;
  const CartProduct({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  State<CartProduct> createState() => _CartProductState();
}

class _CartProductState extends State<CartProduct> {
  bool _isHovered = false;
  final ProductDetailsServices productDetailsServices =
      ProductDetailsServices();
  final CartServices cartServices = CartServices();

  void removeProduct(Product product) {
    cartServices.removeFromCart(context: context, product: product);
  }

  @override
  Widget build(BuildContext context) {
    final productCart =
        Provider.of<UserProvider>(context).user.cart[widget.index];
    final product = Product.fromMap(productCart['product']);
    final quantity = productCart['quantity'];
    final Size screenSize = MediaQuery.of(context).size;

    return SizedBox(
      width: screenSize.width < 600 ? screenSize.width * 0.9 : 250,
      child: Card(
        margin: const EdgeInsets.all(7),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                MouseRegion(
                  onHover: (event) {
                    setState(() {
                      _isHovered = true;
                    });
                  },
                  onExit: (event) {
                    setState(() {
                      _isHovered = false;
                    });
                  },
                  child: GestureDetector(
                    child: CachedNetworkImage(
                      height: screenSize.width < 600 ? 150 : 200,
                      width: screenSize.width < 600 ? 200 : 300,
                      imageUrl: product.images[0],
                      fit: BoxFit.cover,
                      placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: IconButton(
                    onPressed: () => removeProduct(product),
                    icon: const Icon(Icons.close),
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  product.name,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
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
                  'In Stock',
                  style: TextStyle(
                    color: Colors.teal,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 13),
            Center(
              child: ElevatedButton.icon(
                onPressed: () => removeProduct(product),
                icon: const Icon(Icons.delete),
                label: const Text('Supprimer'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                  textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  minimumSize: const Size(150, 50),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
