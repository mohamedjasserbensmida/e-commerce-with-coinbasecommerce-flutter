import 'package:flutter/material.dart';
import 'package:financeLine/common/widgets/custom_button.dart';
import 'package:financeLine/features/cart/widgets/cart_product.dart';
import 'package:financeLine/features/cart/widgets/cart_subtotal.dart';
import 'package:financeLine/features/paiement/services/paiement_service.dart';
import 'package:financeLine/features/home/widgets/address_box.dart';
import 'package:provider/provider.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

import '../../../constants/global_variables.dart';
import '../../../providers/user_provider.dart';
import '../../search/screens/search_screen.dart';
import '../../cart/screens/animation.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  void navigateToSearchScreen(String query) {
    Navigator.pushNamed(context, SearchScreen.routeName, arguments: query);
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          elevation: 0,
          flexibleSpace: Container(
            decoration:
                const BoxDecoration(gradient: GlobalVariables.appBarGradient),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  height: 42,
                  margin: const EdgeInsets.only(left: 15),
                  child: Material(
                    borderRadius: BorderRadius.circular(7),
                    elevation: 1,
                    child: TextFormField(
                      onFieldSubmitted: navigateToSearchScreen,
                      decoration: InputDecoration(
                          prefixIcon: InkWell(
                            onTap: () {},
                            child: const Padding(
                              padding: EdgeInsets.only(left: 6),
                              child: Icon(
                                Icons.search,
                                color: Colors.black,
                                size: 23,
                              ),
                            ),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.only(top: 10),
                          border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(7),
                              ),
                              borderSide: BorderSide.none),
                          enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(7),
                            ),
                            borderSide:
                                BorderSide(color: Colors.black38, width: 1),
                          ),
                          hintText: 'Search...',
                          hintStyle: const TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w500)),
                    ),
                  ),
                ),
              ),
              Container(
                color: Colors.transparent,
                height: 42,
                margin: const EdgeInsets.symmetric(horizontal: 10),
              )
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: ListView.builder(
                  itemCount: user.cart.length,
                  itemBuilder: (context, index) {
                    return CartProduct(
                      index: index,
                    );
                  }),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            color: Colors.black12.withOpacity(0.08),
            height: 1,
          ),
          const SizedBox(
            height: 5,
          ),
          const CartSubtotal(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton.icon(
              icon: Icon(Icons.payment),
              onPressed: () async {
                await makePayment(context);
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => Scaffold(
                      appBar: AppBar(
                        elevation: 0,
                        flexibleSpace: Container(
                          decoration: const BoxDecoration(
                              gradient: GlobalVariables.appBarGradient),
                        ),
                        title: Text('Checkout'),
                      ),
                      body: Center(
                        child: AnimatedTextScrolling(),
                      ),
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blue[800],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 18),
              ),
              label: Text(
                'Checkout',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
