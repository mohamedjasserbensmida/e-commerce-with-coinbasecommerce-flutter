import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badge;
import 'package:financeLine/common/widgets/loader.dart';
import 'package:financeLine/features/home/widgets/address_box.dart';
import 'package:financeLine/features/product_details/screens/product_details_screen.dart';
import 'package:financeLine/features/search/services/search_services.dart';
import 'package:financeLine/features/search/widgets/searched_product.dart';
import 'package:financeLine/models/product.dart';
import 'package:financeLine/providers/user_provider.dart';
import 'package:financeLine/features/cart/screens/cart_screen.dart';
import 'package:provider/provider.dart';

import '../../../constants/global_variables.dart';

class SearchScreen extends StatefulWidget {
  static const String routeName = 'search-screen';
  final String searchQuery;
  const SearchScreen({Key? key, required this.searchQuery}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Product>? products;
  int _page = 0;
  final SearchServices searchServices = SearchServices();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchtheSearchedProducts();
  }

  List<Widget> pages = [const CartScreen()];

  fetchtheSearchedProducts() async {
    products = await searchServices.fetchSearchedProduct(
        context: context, searchQuery: widget.searchQuery);
    setState(() {});
  }

  void updatePage(int page) {
    CartScreen(); // close the menu after selecting a page
  }

  void navigateToSearchScreen(String query) {
    Navigator.pushNamed(context, SearchScreen.routeName, arguments: query);
  }

  @override
  Widget build(BuildContext context) {
    final userCartLen = context.watch<UserProvider>().user.cart.length;
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
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: GestureDetector(
                    onTap: () {
                      updatePage(0);
                    },
                    child: badge.Badge(
                      elevation: 0,
                      badgeContent: Text(userCartLen.toString()),
                      badgeColor: Colors.white,
                      child: const Icon(
                        Icons.shopping_cart_outlined,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        body: products == null
            ? const Loader()
            : Column(
                children: [
                  const AddressBox(),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                      child: ListView.builder(
                    itemCount: products!.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, ProductDetailsScreen.routeName,
                                arguments: products![index]);
                          },
                          child: SearchedProduct(product: products![index]));
                    },
                  ))
                ],
              ));
  }
}
