import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badge;
import 'package:financeLine/features/cart/screens/cart_screen.dart';
import 'package:financeLine/features/cart/widgets/cart_product.dart';
import 'package:financeLine/features/home/widgets/address_box.dart';
import 'package:financeLine/features/home/widgets/carousel_images.dart';
import 'package:financeLine/features/home/widgets/deal_of_day.dart';
import 'package:financeLine/features/home/widgets/top_categories.dart';
import 'package:financeLine/features/search/screens/search_screen.dart';
import 'package:financeLine/providers/user_provider.dart';
import 'package:provider/provider.dart';

import '../../../constants/global_variables.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "/home";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _page = 0;
  void navigateToSearchScreen(String query) {
    Navigator.pushNamed(context, SearchScreen.routeName, arguments: query);
  }

  List<Widget> pages = [const CartScreen()];
  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    final userCartLen = context.watch<UserProvider>().user.cart.length;
    final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: AppBar(
              elevation: 0,
              flexibleSpace: Container(
                decoration: const BoxDecoration(
                  gradient: GlobalVariables.appBarGradient,
                ),
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
                              borderSide: BorderSide.none,
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(7),
                              ),
                              borderSide:
                                  BorderSide(color: Colors.white, width: 1),
                            ),
                            hintText: 'Search...',
                            hintStyle: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.transparent,
                    height: 42,
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CartScreen(),
                          ),
                        );
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
            )),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // AddressBox
              Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: SizedBox(
                  width: double.infinity,
                  child: AddressBox(),
                ),
              ),

              // CarouselImages
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: CarouselImages(),
              ),

              // TopCategories
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: TopCategories(),
              ),

              // DealOfDay
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: DealOfDay(),
              ),
            ],
          ),
        ));
  }
}
