import 'package:badges/badges.dart' as badge;
import 'package:financeLine/features/admin/screens/add_product_screen.dart';
import 'package:financeLine/features/live/LiveShoppingPage.dart';
import 'package:flutter/material.dart';
import 'package:financeLine/constants/global_variables.dart';
import 'package:financeLine/features/account/screens/account_screen.dart';
import 'package:financeLine/features/cart/screens/cart_screen.dart';
import 'package:financeLine/features/cart/widgets/cart_product.dart';
import 'package:financeLine/features/live/LiveShoppingPage.dart';

import 'package:financeLine/features/home/screens/home_screen.dart';
import 'package:financeLine/providers/user_provider.dart';
import 'package:provider/provider.dart';

class BottomBar extends StatefulWidget {
  static const String routeName = "/actual-home";
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar>
    with SingleTickerProviderStateMixin {
  bool _isOpen = false;
  int _page = 0;
  double bottomBarHeightCollapsed = 42;
  double bottomBarHeightExpanded = 250;
  double bottomBarBorderWidth = 5;

  List<Widget> pages = [
    const HomeScreen(),
    const AccountScreen(),
    const CartScreen(),
    const AddProductScreen(),
    const LiveShoppingPage()
  ];

  void updatePage(int page) {
    setState(() {
      _page = page;
      _isOpen = false; // close the bottom bar when navigating to a new page
    });
    Navigator.pop(context); // close the menu after selecting a page
  }

  late AnimationController _animationController;
  double _currentHeight = 42.0; // la hauteur actuelle de la barre en bas

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
  }

  @override
  void dispose() {
    super.dispose();
  }

  void toggleBottomBar() {
    setState(() {
      _isOpen = !_isOpen;
      _currentHeight =
          _isOpen ? bottomBarHeightExpanded : bottomBarHeightCollapsed;
    });
    if (_isOpen) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    final userCartLen = context.watch<UserProvider>().user.cart.length;
    final isDesktop = MediaQuery.of(context).size.width > 600;
    return Scaffold(
      extendBodyBehindAppBar:
          true, // set to true to extend the body behind the appbar
      appBar: AppBar(
        leading: isDesktop
            ? null
            : Builder(
                builder: (BuildContext context) {
                  return IconButton(
                    icon: const Icon(Icons.menu),
                    onPressed: () {
                      Scaffold.of(context).openDrawer(); // open the menu
                    },
                  );
                },
              ),

        backgroundColor:
            Colors.transparent, // set the background color to transparent
        elevation: 0, // remove the appbar shadow
        // add padding to the content
      ),
      drawer: isDesktop
          ? null
          : Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  const DrawerHeader(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                    ),
                    child: Text(
                      'Menu',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  const SizedBox(
                      height:
                          16), // add space between the header and the first ListTile
                  ListTile(
                    leading: Icon(Icons.home_outlined,
                        size: 32), // increase the size of the icon
                    title: const Text('Home'),
                    onTap: () {
                      updatePage(0); // navigate to home page
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.person_outlined),
                    title: const Text('Account'),
                    onTap: () {
                      updatePage(1); // navigate to account page
                    },
                  ),
                  ListTile(
                    leading: badge.Badge(
                      elevation: 0,
                      badgeContent: Text(userCartLen.toString()),
                      badgeColor: Colors.white,
                      child: const Icon(
                        Icons.shopping_cart_outlined,
                      ),
                    ),
                    title: const Text('Cart'),
                    onTap: () {
                      updatePage(2); // navigate to cart page
                      // navigate to cart page
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.add_circle_outline),
                    title: const Text('Add Product'),
                    onTap: () {
                      updatePage(3); // navigate to add product page
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.add_circle_outline),
                    title: const Text('Live Shopping'),
                    onTap: () {
                      updatePage(4); // navigate to add product page
                    },
                  )
                ],
              ),
            ),
      body: pages[_page],
    );
  }
}
